# ===== ===== ===== ===== ===== ===== ===== ===== 
# Ringnorm Data: Error Rates
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
resPath = "/Users/chuckjia/Desktop/P556 - HW2/Results"

numCluster <- array(t(array(2:5, dim = c(4,20))))
# Ringnorm Errors with EM
fileName = "/Mac-EMPCA-Ringnorm-tol1e-6-maxItr200/Prob4_EMPCA_Ringnorm_ErrRes.RData"
load(paste(resPath, fileName, sep = ""))
errEM <- array(totalErrRateMat)
# Ringnorm Errors with k-means
fileName = "/Mac-kmeansPCA-Ringnorm-tol1e-5-maxItr200/Prob4_kmeansPCA_Ringnorm_ErrRes.RData"
load(paste(resPath, fileName, sep = ""))
errkmeans <- array(totalErrRateMat)
errFrame <- data.frame(numCluster, errEM, errkmeans)

# Whisker plot for EM and k-means 
title = "Total Error Rates from EM and k-means with PCA"
boxplot(errEM ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Total Error Rates",
        ylab = "Number of Clusters")
boxplot(errkmeans ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        add = TRUE)

# Whisker plots for EM
title = "Total Error Rates from EM with PCA"
boxplot(errEM ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Total Error Rates",
        ylab = "Number of Clusters")

# Whisker plots for k-means
title = "Total Error Rates from k-means with PCA"
boxplot(errkmeans ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        main = title,
        xlab = "Total Error Rates",
        ylab = "Number of Clusters")




# ===== ===== ===== ===== ===== ===== ===== ===== 
# Ionosphere Data: Error Rates
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
resPath = "/Users/chuckjia/Desktop/P556 - HW2/Results"

numCluster <- array(t(array(2:5, dim = c(4,20))))
# Ionosphere Errors with EM
fileName = "/Mac-EMPCA-Ionosphere-tol1e-5-maxItr200/Prob3_EMPCA_Ionosphere_ErrRes.RData"
load(paste(resPath, fileName, sep = ""))
errEM <- array(totalErrRateMat)
# Ionosphere Errors with k-means
fileName = "/Mac-kmeansPCA-Ionosphere-tol1e-5-maxItr200/Prob4_kmeansPCA_Ionosphere_ErrRes.RData"
load(paste(resPath, fileName, sep = ""))
errkmeans <- array(totalErrRateMat)
errFrame <- data.frame(numCluster, errEM, errkmeans)

# Whisker plot for EM and k-means 
title = "Total Error Rates from EM and k-means with PCA"
boxplot(errEM ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Total Error Rates",
        ylab = "Number of Clusters")
boxplot(errkmeans ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        add = TRUE)

# Whisker plots for EM
title = "Total Error Rates from EM with PCA"
boxplot(errEM ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Total Error Rates",
        ylab = "Number of Clusters")

# Whisker plots for k-means
title = "Total Error Rates from k-means with PCA"
boxplot(errkmeans ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        main = title,
        xlab = "Total Error Rates",
        ylab = "Number of Clusters")


# ===== ===== ===== ===== ===== ===== ===== ===== 
# Ringnorm Data: Iteration Counts
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
resPath = "/Users/chuckjia/Desktop/P556 - HW2/Results"

numCluster <- array(t(array(2:5, dim = c(4,20))))
# Ringnorm Errors with EM
fileName = "/Mac-EMPCA-Ringnorm-tol1e-6-maxItr200/Prob4_EMPCA_Ringnorm_ItrRes.RData"
load(paste(resPath, fileName, sep = ""))
itrEM <- array(numItrMat)
# Ringnorm Errors with k-means
fileName = "/Mac-kmeansPCA-Ringnorm-tol1e-5-maxItr200/Prob4_kmeansPCA_Ringnorm_ItrRes.RData"
load(paste(resPath, fileName, sep = ""))
itrkmeans <- array(numItrMat)
itrFrame <- data.frame(numCluster, itrEM, itrkmeans)

# Whisker plot for EM and k-means 
title = "Iteration Counts from EM and k-means with PCA"
boxplot(itrEM ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters")
boxplot(itrkmeans ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        add = TRUE)

# Whisker plots for EM
title = "Iteration Counts from EM with PCA"
boxplot(itrEM ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters")

# Whisker plots for k-means
title = "Iteration Counts from k-means with PCA"
boxplot(itrkmeans ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters")


# ===== ===== ===== ===== ===== ===== ===== ===== 
# Ionosphere Data: Iteration Counts
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
resPath = "/Users/chuckjia/Desktop/P556 - HW2/Results"

numCluster <- array(t(array(2:5, dim = c(4,20))))
# Ionosphere Errors with EM
fileName = "/Mac-EMPCA-Ionosphere-tol1e-5-maxItr200/Prob3_EMPCA_Ionosphere_ItrRes.RData"
load(paste(resPath, fileName, sep = ""))
itrEM <- array(numItrMat)
# Ionosphere Errors with k-means
fileName = "/Mac-kmeansPCA-Ionosphere-tol1e-5-maxItr200/Prob4_kmeansPCA_Ionosphere_ItrRes.RData"
load(paste(resPath, fileName, sep = ""))
itrkmeans <- array(numItrMat)
itrFrame <- data.frame(numCluster, itrEM, itrkmeans)

# Whisker plot for EM and k-means 
title = "Iteration Counts from EM and k-means with PCA"
boxplot(itrEM ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters",
        ylim = c(3, 50))
boxplot(itrkmeans ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        add = TRUE)

# Whisker plots for EM
title = "Iteration Counts from EM with PCA"
boxplot(itrEM ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters")

# Whisker plots for k-means
title = "Iteration Counts from k-means with PCA"
boxplot(itrkmeans ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters")





