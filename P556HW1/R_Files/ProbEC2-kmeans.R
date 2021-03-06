# ===== ===== ===== ===== ===== ===== #
# k-means clustering
# ===== ===== ===== ===== ===== ===== #

n <- nrow(obs)  # Number of observations
d <- ncol(obs)  # Number of dimensions
maxItr = 1000  # Maxium number of iterations allowed
tol = 0.001  # Tolerance
kRange = 2:5  # The range of k used in k-means

totalNumRuns = 20  # Number of runs for each k
totalErrorMat = matrix(0, nrow = 0, ncol = totalNumRuns)  # A matrix in which (i, j) entry stores total errors for the jth run with k = i + 1
SSEMat = matrix(0, nrow = 0, ncol = totalNumRuns)

# Run all k values from kRange
for (k in kRange) {
    message("Clustering with k = ", k)
    totalErrorVec = matrix(0, nrow = 1, ncol = 0)  # A vector with its ith element as the total error from the ith run
    SSEVec = matrix(0, nrow = 1, ncol = 0)
    
    # Run a total of totalNumRuns times
    for (numRun in  1:totalNumRuns) {
        # set.seed(2)
        message("Run no. ", numRun)
        
        # Initialize centroids by randomly labeling all data points
        label <- sample.int(k, size = n, replace = TRUE)
        # Make sure there are k clusters to begin with
        tempSelect = sample.int(n, size = k, replace = FALSE)
        for (i in 1:k) 
            label[tempSelect[i]] <- i
        # Initialize the matrix that stores centroid coordinates
        centroids <- matrix(0, nrow = k, ncol = d)  # k row vectors of dimension d
        # Initialize the vector that stores the number of points in each cluster
        numPoints <- matrix(0, nrow = 1, ncol = k)  # A vector of length k
        
        # Run k-means algorithm (Lloyd)
        # Stopping criterion
        change <- .Machine$double.xmax  # 1-norm of difference between centroids from two iterations
        itr <- 0  # Number of iterations
        SSEVal <- .Machine$double.xmax
        split <- FALSE
        while ((change > tol || split) && itr < maxItr) {
            itr <- itr + 1
            cat("\rCurrent iteration: ", itr)
            
            # Calculate new centroids
            centroids <- matrix(0, nrow = k, ncol = d)  # k row vectors of dimension d
            numPoints <- matrix(0, nrow = 1, ncol = k)  # a vector of length k
            # Calculate the number and sum of all data points in each cluster
            for (i in 1:n) {
                labelNum <- label[i]
                centroids[labelNum, ] <- centroids[labelNum, ] + obs[i, ]
                numPoints[labelNum] <- numPoints[labelNum] + 1
            }
            emptyClusters <- c()  # Stores the index of clusters that become empty
            # Calculate the centroids by taking the mean of data points within each cluster
            for (i in 1:k) {
                currNumPoints <- numPoints[i]
                if (currNumPoints != 0)
                    centroids[i, ] <- centroids[i, ] / currNumPoints
                else
                    emptyClusters <- cbind(emptyClusters, i)
            }
            # If one or more clusters are empty, choose random data points as their centroids
            numEmptyClusters = length(emptyClusters)
            if (numEmptyClusters != 0) {
                split = TRUE
                cand <- c()
                for (i in 1:n) {  # Selecting all data points, EXCEPT for those in clusters with only 1 point
                    labelNum <- label[i]
                    if (numPoints[labelNum] > 1) 
                        cand <- cbind(cand, i)
                }
                candSelected <- sample(cand, size = numEmptyClusters, replace = FALSE)
                for (i in 1:numEmptyClusters) 
                    centroids[emptyClusters[i], ] <- obs[candSelected[i], ]
            } else 
                split = FALSE
            
            # Re-label observations
            for (i in 1:n) {
                currObs <- obs[i, ]
                currLabel <- 1
                minDist <- norm(currObs - centroids[1, ], type = "2")
                for (j in 2:k) {
                    currDist <- norm(currObs - centroids[j, ], type = "2")
                    if (currDist < minDist) {
                        minDist <- currDist
                        currLabel <- j
                    }
                }
                label[i] <- currLabel
            }
            
            # Calculate SSE
            newSSE = 0
            for (i in 1:n) {
                currLabel = label[i]
                diffVec = obs[i, ] - centroids[currLabel, ]
                newSSE = newSSE + as.numeric(diffVec %*% diffVec)
            }
            change <- SSEVal - newSSE
            SSEVal = newSSE
        }
        
        # Calculate the error rates
        # label1Count and label2Count are explicitly calculated for result analysis
        label1Count = matrix(0, nrow = 1, ncol = k)  # Stores label 1 count in each cluster 
        label2Count = matrix(0, nrow = 1, ncol = k)  # Stores label 2 count in each cluster
        # Calculate label counts in all clusters
        for (i in 1:n) {
            classOrig <- classRes[i]
            labelCurr <- label[i]
            if (classOrig == label1) 
                label1Count[labelCurr] = label1Count[labelCurr] + 1
            else 
                label2Count[labelCurr] = label2Count[labelCurr] + 1
        }
        errorRates = matrix(0, nrow = 1, ncol = k)  # Vector storing error rates in each cluster
        for (i in 1:k) {
            label1CountCurr = label1Count[i]
            label2CountCurr = label2Count[i]
            if (label1CountCurr >= label2CountCurr) 
                errorRates[i] = label2CountCurr / (label2CountCurr + label1CountCurr)
            else 
                errorRates[i] = label1CountCurr / (label2CountCurr + label1CountCurr)
        }
        totalError = sum(errorRates)
        # Store the total error of this run in totalErrorVec, which stores total errors from all runs with this k value
        totalErrorVec = cbind(totalErrorVec, totalError)
        SSEVec = cbind(SSEVec, SSEVal)
        
        # Message on completion of run
        message("Run ", numRun, " completed.")
        cat("Total error = ", totalError, " Stopped with change = ", change, "\n")
    }
    # Store total errors from all runs with all k values
    totalErrorMat = rbind(totalErrorMat, totalErrorVec)
    SSEMat = rbind(SSEMat, SSEVec)
}



