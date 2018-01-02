rm(list = ls())

# ===== ===== ===== ===== ===== ===== ===== ===== 
# User-customized Parameters 
# ===== ===== ===== ===== ===== ===== ===== ===== 

maxItr = 100

# ===== ===== ===== ===== ===== ===== ===== ===== 
# Generating test data
# ===== ===== ===== ===== ===== ===== ===== ===== 

numDataPts = 100  # Number of data points in each cluster
# The means and variances used to generate the two data groups
lambda1 = 1
lambda2 = 1

# Generate and combine results to a data set
dataA = rpois(numDataPts, lambda1)
dataC = rpois(numDataPts, lambda2)
obs = matrix(c(dataA, dataC), ncol = 1)
label1 = 1
label2 = 1
classRes = array(2, 2 * numDataPts)
for (i in 1:numDataPts)
    classRes[i] = 1

# ===== ===== ===== ===== ===== ===== 

k = 2  # Number of clusterings
tol = 1e-2  # Tolerance on the change between iterations
n = nrow(obs); d = ncol(obs)  # Parameters from data
obst = t(obs)

cat("===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \n")
cat("~ Running EM on 2 groups of 2D Poisson-generated data\n", sep = "")
cat("  - maxItr = ", maxItr, ", tol = ", tol, "\n", sep = "")
cat("===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \n\n")

# Run EM algorithm
source("/Users/chuckjia/Desktop/P556/P556 - HW2 - All Files/P556 - HW2 - Original/ProbEC2-EM-SingleRun.R")
source("/Users/chuckjia/Desktop/P556/P556 - HW2 - All Files/P556 - HW2 - Original/Prob3-EM-CalcErrRates.R")

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

# Plot the coordinate system, and set the margins
xRightBD = 100; yTopBD = 100
plot(1, type="n", main = "", xlab="", ylab="", xlim = c(0, xRightBD), ylim = c(0, yTopBD))

# Add cluster 1 points with color orange
clusterCol = "orange"
points(t(cluster1), col = clusterCol)
clusterCol = rgb(t(col2rgb(clusterCol) / 1.5), maxColorValue = 255)
points(centroid1, col = clusterCol, bg = clusterCol, pch = 21)

# Add cluster 2 points with color darkgreen
clusterCol = "darkgreen"
points(t(cluster2), col = clusterCol)
clusterCol = rgb(t(col2rgb(clusterCol) / 5), maxColorValue = 255)
points(centroid2, col = clusterCol, bg = clusterCol, pch = 21)

cat("\n\n See plot for the classification result.")
