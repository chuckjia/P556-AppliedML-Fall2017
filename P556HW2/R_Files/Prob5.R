# ===== ===== ===== ===== ===== ===== #
# Problem 5.1
# ===== ===== ===== ===== ===== ===== #

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
set.seed(2)
source(paste(FolderPath, "Prob5-ReadData.R", sep = ""))  # Get 50 data points from Ionosphere set

hclustComplete = hclust(dist(obsSelected), method = "complete")
plot(hclustComplete, main = "Hierarchical Clustering With Complete Linkage", xlab = "", sub = "")

# ===== ===== ===== ===== ===== ===== #
# Problem 5.2
# ===== ===== ===== ===== ===== ===== #

# Need to run 5.1 first
label = cutree(hclustComplete, h = 7)
for (i in 1:50) {
    if (label[i] == 1)
        cat(i, ", ", sep = "")
}
source(paste(FolderPath, "Prob5-CalcErrRates.R", sep = ""))

# ===== ===== ===== ===== ===== ===== #
# Problem 5.3
# ===== ===== ===== ===== ===== ===== #

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
set.seed(2)
source(paste(FolderPath, "Prob5-ReadData.R", sep = ""))  # Get 50 data points from Ionosphere set

pca = prcomp(obsSelected)
# summary(pca)
proportionVar <- pca$sdev^2 / sum(pca$sdev^2)
sum(proportionVar[1:10])  # %90 at PC10 for Ionosphere
obsSelectedPCA = pca$x[, 1:10]
hclustComplete = hclust(dist(obsSelectedPCA), method = "complete")
plot(hclustComplete, main = "Hierarchical Clustering With Complete Linkage\n (After PCA)", xlab = "", sub = "")
label = cutree(hclustComplete, h = 7)
source(paste(FolderPath, "Prob5-CalcErrRates.R", sep = ""))
