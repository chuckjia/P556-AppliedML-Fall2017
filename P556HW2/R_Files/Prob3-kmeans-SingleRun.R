#  ===== ===== ===== ===== ===== ===== 
# Parameters
#  ===== ===== ===== ===== ===== ===== 

# These parameters may be set outside of this file
# n <- nrow(obs)  # Number of observations
# d <- ncol(obs)  # Number of dimensions
# maxItr = 1000  # Maxium number of iterations allowed
# tol = 0.001  # Tolerance

# ===== ===== ===== ===== ===== ===== ===== ===== #
# Initialazation
# ===== ===== ===== ===== ===== ===== ===== ===== #

# Initialize centroids by randomly labeling all data points
if (controlInit)
    set.seed(k * randGen[1] + runNo * randGen[2])
label <- sample.int(k, size = n, replace = TRUE)
# Make sure there are k clusters to begin with
tempDraw = sample.int(n, size = k, replace = FALSE)
for (i in 1:k) 
    label[tempDraw[i]] <- i
# Initialize the matrix that stores centroid coordinates
centroids <- matrix(0, nrow = k, ncol = d)  # k row vectors of dimension d
# Initialize the vector that stores the number of points in each cluster
numPoints <- array(0, dim = k)  # A vector of length k

# ===== ===== ===== ===== ===== ===== ===== ===== #
# Run k-means algorithm (Lloyd)
# ===== ===== ===== ===== ===== ===== ===== ===== #

# Stopping criterion
change <- .Machine$double.xmax  # 1-norm of difference between centroids from two iterations
itr <- 0  # Number of iterations
while (change > tol && itr < maxItr) {
    itr <- itr + 1
    cat("\r  - Current iteration: ", itr)
    
    # Initialize matrix to calculate the norm of change in centroids between steps
    # diffMat stores the difference between centroids from current and previous steps. 
    diffMat <- centroids # diffMat for now stores previous centroids
    
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
            emptyClusters <- c(emptyClusters, i)
    }
    # If one or more clusters are empty, choose random data points as their centroids
    numEmptyClusters = length(emptyClusters)
    if (numEmptyClusters != 0) {
        cand <- c()
        for (i in 1:n) {  # Selecting all data points, EXCEPT for those in clusters with only 1 point
            labelNum <- label[i]
            if (numPoints[labelNum] > 1) 
                cand <- c(cand, i)
        }
        candSelected <- sample(cand, size = numEmptyClusters, replace = FALSE)
        for (i in 1:numEmptyClusters) 
            centroids[emptyClusters[i], ] <- obs[candSelected[i], ]
    }
    
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
    
    # Calculate change
    diffMat <- diffMat - centroids
    change <- sum(diffMat * diffMat)
    change <- sqrt(change / k)
}
cat("\r  - Completed.", " Iterations: ", itr, "\n", sep = "")


