rm(list = ls())

# ===== ===== ===== ===== ===== ===== ===== ===== 
# User-customized Parameters 
# ===== ===== ===== ===== ===== ===== ===== ===== 

maxItr = 100

# ===== ===== ===== ===== ===== ===== ===== ===== 
# Generating test data
# ===== ===== ===== ===== ===== ===== ===== ===== 

numDataPts = 50  # Number of data points in each cluster
# The means and variances used to generate the two data groups
mA <- 0; sdA <- 1
mB <- 0; sdB <- 1
mC <- 10; sdC <- 2
mD <- 10; sdD <- 2

# Generate and combine results to a data set
dataA = rnorm(numDataPts, mean = mA, sd = sdA)
dataB = rnorm(numDataPts, mean = mB, sd = sdB)
dataComb1 = cbind(dataA, dataB)
dataC = rnorm(numDataPts, mean = mC, sd = sdC)
dataD = rnorm(numDataPts, mean = mD, sd = sdD)
dataComb2 = cbind(dataC, dataD)
obs = rbind(dataComb1, dataComb2)
label1 = 1
label2 = 2
classRes = array(2, 2 * numDataPts)
for (i in 1:numDataPts)
    classRes[i] = 1
trueCenter1 = matrix(c(mA, mB), nrow = 1)
trueCenter2 = matrix(c(mC, mD), nrow = 1)

# ===== ===== ===== ===== ===== ===== 

k = 2  # Number of clusterings
tol = 1e-2  # Tolerance on the change between iterations
n = nrow(obs); d = ncol(obs)  # Parameters from data
obst = t(obs)

cat("===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \n")
cat("~ Running EM on 2 groups of 2D normally-generated data\n", sep = "")
cat("  - maxItr = ", maxItr, ", tol = ", tol, "\n", sep = "")
cat("===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \n\n")

# Run EM algorithm
source("/Users/chuckjia/Desktop/P556 - HW2/Prob3-EM-SingleRun.R")
source("/Users/chuckjia/Desktop/P556 - HW2/Prob3-EM-CalcErrRates.R")

# ===== ===== ===== ===== ===== ===== ===== ===== 
# Plotting the result
# ===== ===== ===== ===== ===== ===== ===== ===== 

# The two clusters of data points are reprensented by circles of two different 
# colors, respectively. The dots are the predicted centers of the two clusters.
# The centers of the squares represent the real centers of the clusters.

# Result analysis: testing
cluster1 = matrix(0, nrow = 2, ncol = 0)
cluster2 = matrix(0, nrow = 2, ncol = 0)
for (i in 1:n) {
    if (label[i] == 1) 
        cluster1 = cbind(cluster1, obs[i,])
    else
        cluster2 = cbind(cluster2, obs[i,])
}

centroid1 = matrix(rowMeans(cluster1), nrow = 1, ncol = 2)
centroid2 = matrix(rowMeans(cluster2), nrow = 1, ncol = 2)
if (norm(centroid1 - trueCenter1, type = "2") > norm(centroid2 - trueCenter1, type = "2")) {
    trueCenter2 = matrix(c(mA, mB), nrow = 1)
    trueCenter1 = matrix(c(mC, mD), nrow = 1)
}

# Plot the coordinate system, and set the margins
marg = 2 * max(sdA, sdB, sdC, sdD)
xLeftLim = min(mA - sdA, mC - sdC) - marg
xRightLim = max(mA + sdA, mC + sdC) + marg
yBottLim = min(mB - sdB, mD - sdD) - marg
yToplim = max(mB + sdB, mD + sdD) + marg
plot(1, type="n", main = "", xlab="", ylab="", xlim=c(xLeftLim, xRightLim), ylim=c(yBottLim, yToplim))

# Add cluster 1 points with color orange
clusterCol = "orange"
points(t(cluster1), col = clusterCol)
clusterCol = rgb(t(col2rgb(clusterCol) / 1.5), maxColorValue = 255)
points(centroid1, col = clusterCol, bg = clusterCol, pch = 21)
points(trueCenter1, col = clusterCol, pch = 22, cex = 5)

# Add cluster 2 points with color darkgreen
clusterCol = "darkgreen"
points(t(cluster2), col = clusterCol)
clusterCol = rgb(t(col2rgb(clusterCol) / 5), maxColorValue = 255)
points(centroid2, col = clusterCol, bg = clusterCol, pch = 21)
points(trueCenter2, col = clusterCol, pch = 22, cex = 5)

cat("\n\n See plot for the classification result.")
