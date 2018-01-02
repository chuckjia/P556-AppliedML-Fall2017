# Ionosphere data
rm(list = ls())
obs <- read.table("/Users/chuckjia/Desktop/P556 - HW1/ionosphere.data", sep = ",")
classRes <- data.matrix(obs[ ,35])  # Classification results
obs <- data.matrix(obs[ , 1:34])

# Clusterin parameters
k <- 5  # Number of clusters
n <- nrow(obs)  # Number of observations
d <- ncol(obs)  # Number of dimensions

# Initialize centroids
set.seed(2)
label <- sample.int(k, size = n, replace = TRUE)
for (i in 1:k) {
    label[i] = i
}

centroids <- matrix(0, nrow = k, ncol = d)  # k row vectors of dimension d
numPoints <- matrix(0, nrow = 1, ncol = k)  # a vector of length k
err <- 1e20
itr = 0

while (err > 0.1 && itr < 1000) {
    itr = itr + 1
    print(itr)
    
    diffMat = matrix(nrow = 0, ncol = d)
    for (i in 1:k) {  # Store previous centroids in diffMat
        diffMat <- rbind(diffMat, centroids[i, ])  
    }
    
    # Calculate new centroids
    centroids <- matrix(0, nrow = k, ncol = d)  # k row vectors of dimension d
    numPoints <- matrix(0, nrow = 1, ncol = k)  # a vector of length k
    for (i in 1:n) {
        labelNum = label[i]
        centroids[labelNum, ] <- centroids[labelNum, ] + obs[i, ]
        numPoints[labelNum] <- numPoints[labelNum] + 1
    }
    for (i in 1:k) {
        centroids[i,] <- centroids[i,] / numPoints[i]
    }
    
    # Re-label observations
    for (i in 1:n) {
        currLabel <- 1
        currObs <- obs[i, ]
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
    
    # Calculate err
    diffMat <- diffMat - centroids
    err <- 0
    for (i in 1:k) {
        err <- err + norm(diffMat[i, ], type = "2")
    }
    err <- err / k
    print(err)
}



for (i in 1:n) {
    if (label[i] == 5) {
        print(classRes[i])        
    }
}





