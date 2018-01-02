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

# Initialization of mu
mu <- matrix(0, nrow = d, ncol = k)
mu[, 1] <- obst[, sample.int(n, size = 1)]
for (i in 2:k) { 
    lastmuChosen = i - 1
    DxVec = array(0, dim = n)
    for (j in 1:n) {
        # Calculate D(x)
        Dx = .Machine$double.xmax
        for (jj in 1:lastmuChosen) {
            newDx = norm(obst[, j] - mu[, jj], type = "2")
            if (newDx < Dx)
                Dx = newDx
        }
        DxVec[j] = Dx
    }
    mu[, i] = obst[, sample.int(n, size = 1, prob = DxVec)]
}

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
        centeredObs = obs - mu[, i]
        covMat[,, i] <- t(centeredObs) %*% (centeredObs * wt[, i]) / wtColSums[i]
    }
    
    # New prior probabilities
    prior <- wtColSums / n
}
cat("\r  - Completed. Iterations: ", itr, "\n", sep = "")

label = array(1, dim = n)

# Calculate clustering results
for (j in 1:n) {
    clusterNo <- label[j]
    likelihoods <- wt[j,]
    newClusterNo <- which.max(likelihoods)
    if (likelihoods[newClusterNo] > likelihoods[clusterNo])
        label[j] <- newClusterNo
}



