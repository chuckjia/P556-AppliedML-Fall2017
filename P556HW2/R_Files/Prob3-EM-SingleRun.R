library(mvtnorm)

#  ===== ===== ===== ===== ===== ===== 
# Parameters
#  ===== ===== ===== ===== ===== ===== 

# These parameters may be set outside of this file
# k <- 2  # Number of clusterings
# maxItr <- 100  # Maximum number of interations
# tol <- 1e-2  # Tolerance on the change between iterations
# n <- nrow(obs); d <- ncol(obs)  # Parameters from data
# obst <- t(obs)

# ===== ===== ===== ===== ===== ===== 
# Initilization
# ===== ===== ===== ===== ===== ===== 

# Initialization of clusters
if (controlInit)
    set.seed(k * randGen[1] + runNo * randGen[2])
label <- sample.int(k, size = n, replace = TRUE)  # label[i] stores the cluster assignment of data point i
tempDraw <- sample.int(n, size = k, replace = FALSE)  # Randomly draw k data points 
for (i in 1:k)  # Assign the k randomly drawn points to cluster 1 - k, making sure no clusters are empty
    label[tempDraw[i]] = i
numPts <- array(0, dim = k)  # numPts[i] stores the number of data points in cluster i

# Initialization of mu
mu <- matrix(0, nrow = d, ncol = k)
for (j in 1:n) {
    labelNo <- label[j]
    mu[, labelNo] <- mu[, labelNo] + obst[, j]
    numPts[labelNo] <- numPts[labelNo] + 1
}
mu <- scale(mu, center = FALSE, scale = numPts)
# Initialization of covariance matrix
covMat <- array(diag(d), dim = c(d,d,k))
# Initialization of prior probabilities
prior <- array(1. / k, dim = k)
# Initialization of the transpose of the w matrix
wt <- matrix(0, nrow = n, ncol = k)

zeroCovMat <- array(0, dim = c(d, d, k))

# ===== ===== ===== ===== ===== ===== 
# EM Steps
# ===== ===== ===== ===== ===== =====

change <- .Machine$double.xmax
itr <- 0
while (change > tol && itr < maxItr) {
    itr <- itr + 1
    cat("\r  - Current Iteration: ", itr, sep = "")
    
    # Expectation step
    for (i in 1:k) 
        wt[, i] <- dmvnorm(x = obs, mean = mu[, i], sigma = covMat[,, i]) * prior[i]
    wt <- wt / rowSums(wt)  # rowSums(wt) sums the i index
    wtColSums <- colSums(wt)  # wtColSums[i] = value of sum_{j=1}^n w_{ij}
    
    # Maximization step
    # New mu matrix
    muNew <- scale(obst %*% wt, center = FALSE, scale = wtColSums)
    thisChange <- muNew - mu
    change <- sum(thisChange * thisChange)
    mu <- muNew
    
    # New covariance matrix
    covMat <- zeroCovMat
    for (i in 1:k) {
        for (j in 1:n) {
            centeredPt <- matrix(obst[, j] - mu[, i], ncol = 1)
            covMat[,, i] <- covMat[,, i] + wt[j, i] * centeredPt %*% t(centeredPt)
        }
        covMat[,, i] <- covMat[,, i] / wtColSums[i]
    }
    
    # New prior probabilities
    prior <- wtColSums / n
}
cat("\r  - Completed. Iterations: ", itr, "\n", sep = "")

# Calculate clustering results
for (j in 1:n) {
    clusterNo <- label[j]
    likelihoods <- wt[j,]
    newClusterNo <- which.max(likelihoods)
    if (likelihoods[newClusterNo] > likelihoods[clusterNo])
        label[j] <- newClusterNo
}



