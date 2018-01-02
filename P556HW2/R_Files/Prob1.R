# Problem 1
# Part (a)

rm(list = ls())
dissimMat = matrix(c(0, 0.3, 0.4, 0.7, 0.3, 0, 0.5, 0.8, 0.4, 0.5, 0, 0.45, 0.7, 0.8, 0.45, 0), nrow = 4, byrow = T)
dissimMat = as.dist(dissimMat)
hclustRes = hclust(dissimMat, method = "complete")
plot(hclustRes, col = "darkgreen", xlab = "Observations")

# Hand calculated result
# This is the result after putting 1 and 2 in one cluster
# The first row/column represent the cluster of (1, 2)
dissimMat2 = matrix(c(0, 0.5, 0.8, 0.5, 0, 0.45, 0.8, 0.45, 0), nrow = 3, byrow = T)
print(dissimMat2)


# Part (b)

rm(list = ls())
dissimMat = matrix(c(0, 0.3, 0.4, 0.7, 0.3, 0, 0.5, 0.8, 0.4, 0.5, 0, 0.45, 0.7, 0.8, 0.45, 0), nrow = 4, byrow = T)
dissimMat = as.dist(dissimMat)
hclustRes = hclust(dissimMat, method = "single")
plot(hclustRes, col = "darkgreen", xlab = "Observations")


# Part (d)

rm(list = ls())
dissimMat = matrix(c(0, 0.3, 0.4, 0.7, 0.3, 0, 0.5, 0.8, 0.4, 0.5, 0, 0.45, 0.7, 0.8, 0.45, 0), nrow = 4, byrow = T)
dissimMat = as.dist(dissimMat)
hclustRes = hclust(dissimMat, method = "complete")
label = c(2, 1, 4, 3)
plot(hclustRes, labels = label, col = "darkgreen", xlab = "Observations")


