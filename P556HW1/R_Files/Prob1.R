# HW1 Problem 1
rm(list = ls())

# Part (a)

# The original observed data 
obs = matrix(c(1, 4, 1, 3, 0, 4, 5, 1, 6, 2, 4, 0), nrow = 6, ncol = 2, byrow = TRUE)

# Plot the observations
plot(obs, col = "darkgreen", bg = "darkgreen", pch = 21, xlab = expression('X'[1]), ylab = expression('X'[2]), main = "Observations")

# ----- ----- ----- ----- ----- ----- #

# Part (b)

# Generate labels
set.seed(2)
label = sample.int(2, 6, replace = TRUE)

# ----- ----- ----- ----- ----- ----- #

# Part (c)

cluster1 = c()
cluster2 = c()
for (i in 1:6) {
  if (label[i] == 1) {
    cluster1 = rbind(cluster1, obs[i,])
  } else {
    cluster2 = rbind(cluster2, obs[i,])
  }
}
centroid1 = c(mean(cluster1[ , 1]), mean(cluster1[ , 2]))
centroid2 = c(mean(cluster2[ , 1]), mean(cluster2[ , 2]))


# Part (d)

distFromCentroid1 = matrix(0, 1, 6)
distFromCentroid2 = matrix(0, 1, 6)
for (i in 1:6) {
  distFromCentroid1[i] = norm(obs[i,] - centroid1, type = "2")
  distFromCentroid2[i] = norm(obs[i,] - centroid2, type = "2")
}

label = matrix(1, 1, 6)
for (i in 1:6) 
  if (distFromCentroid1[i] > distFromCentroid2[i]) 
    label[i] = 2


# Part (f)

plot(obs, col = "white", bg = "white", pch = 21, xlab = expression('X'[1]), ylab = expression('X'[2]), main = "Observations")
points(obs[1:3,], col = "orange", bg = "orange", pch = 21)
points(obs[4:6,], col = "darkgreen", bg = "darkgreen", pch = 21)
legend(4.75, 3.8, legend = c("Cluster 1", "Cluster 2"), col = c("darkgreen", "orange"), pt.bg = c("darkgreen", "orange"), lty = 0, pch = 21, cex = 0.8)

