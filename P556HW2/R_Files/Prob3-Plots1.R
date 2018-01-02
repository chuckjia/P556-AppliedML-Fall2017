# ===== ===== ===== ===== ===== ===== ===== ===== 
# Ringnorm Data: Error Rates
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
resPath = "/Users/chuckjia/Desktop/P556 - HW2/Results"

numCluster <- array(t(array(2:5, dim = c(4,20))))
# Ringnorm Errors with EM
fileName = "/Mac-EM-Ringnorm-tol1e-6-maxItr-200/Prob3_EM_Ringnorm_ErrRes.RData"
load(paste(resPath, fileName, sep = ""))
errEM <- array(totalErrRateMat)
# Ringnorm Errors with k-means
fileName = "/Mac-kmeans-Ringnorm-tol1e-5-maxItr200/Prob3_kmeans_Ringnorm_ErrRes.RData"
load(paste(resPath, fileName, sep = ""))
errkmeans <- array(totalErrRateMat)
errFrame <- data.frame(numCluster, errEM, errkmeans)

# Whisker plot for EM and k-means 
title = "Total Error Rates from EM and k-means"
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
title = "Total Error Rates from EM"
boxplot(errEM ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Total Error Rates",
        ylab = "Number of Clusters")

# Whisker plots for k-means
title = "Total Error Rates from k-means"
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
fileName = "/Mac-EM-Ionosphere-tol-1e-5-maxItr-200/Prob3_EM_Ionosphere_ErrRes.RData"
load(paste(resPath, fileName, sep = ""))
errEM <- array(totalErrRateMat)
# Ionosphere Errors with k-means
fileName = "/Mac-kmeans-Ionosphere-tol-1e-5-maxItr200/Prob3_kmeans_Ionosphere_ErrRes.RData"
load(paste(resPath, fileName, sep = ""))
errkmeans <- array(totalErrRateMat)
errFrame <- data.frame(numCluster, errEM, errkmeans)

# Whisker plot for EM and k-means 
title = "Total Error Rates from EM and k-means"
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
title = "Total Error Rates from EM"
boxplot(errEM ~ numCluster, 
        data = errFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Total Error Rates",
        ylab = "Number of Clusters")

# Whisker plots for k-means
title = "Total Error Rates from k-means"
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
fileName = "/Mac-EM-Ringnorm-tol1e-6-maxItr-200/Prob3_EM_Ringnorm_ItrRes.RData"
load(paste(resPath, fileName, sep = ""))
itrEM <- array(numItrMat)
# Ringnorm Errors with k-means
fileName = "/Mac-kmeans-Ringnorm-tol1e-5-maxItr200/Prob3_kmeans_Ringnorm_ItrRes.RData"
load(paste(resPath, fileName, sep = ""))
itrkmeans <- array(numItrMat)
itrFrame <- data.frame(numCluster, itrEM, itrkmeans)

# Whisker plot for EM and k-means 
title = "Iteration Counts from EM and k-means"
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
title = "Iteration Counts from EM"
boxplot(itrEM ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters")

# Whisker plots for k-means
title = "Iteration Counts from k-means"
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
fileName = "/Mac-EM-Ionosphere-tol-1e-5-maxItr-200/Prob3_EM_Ionosphere_ItrRes.RData"
load(paste(resPath, fileName, sep = ""))
itrEM <- array(numItrMat)
# Ionosphere Errors with k-means
fileName = "/Mac-kmeans-Ionosphere-tol-1e-5-maxItr200/Prob3_kmeans_Ionosphere_ItrRes.RData"
load(paste(resPath, fileName, sep = ""))
itrkmeans <- array(numItrMat)
itrFrame <- data.frame(numCluster, itrEM, itrkmeans)

# Whisker plot for EM and k-means 
title = "Iteration Counts from EM and k-means"
boxplot(itrEM ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters",
        ylim = c(3,30))
boxplot(itrkmeans ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        add = TRUE)

# Whisker plots for EM
title = "Iteration Counts from EM"
boxplot(itrEM ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "orange", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters")

# Whisker plots for k-means
title = "Iteration Counts from k-means"
boxplot(itrkmeans ~ numCluster, 
        data = itrFrame, 
        horizontal = TRUE, 
        col = "darkgreen", 
        main = title,
        xlab = "Iteration Count",
        ylab = "Number of Clusters")


