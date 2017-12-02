# Prob4.R: Plotting results from KNN and Naive Bayes for comparison

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Line and dot plots
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
rm(list = ls())

numFold <- 5
# cat(errAll_KNN_Iono_1norm[,1], sep = ", ")
# cat(errAll_KNN_Car_1norm[,1], sep = ", ")
# cat(errAll_KNN_Crx_1norm[,13], sep = ", ")

err_KNN_iono_k1 <- c(0.08571429, 0.1, 0.05714286, 0.1, 0.07042254)
err_KNN_car_k1 <- c(0.09537572, 0.06647399, 0.06936416, 0.05202312, 0.05523256)
err_KNN_crx_k13 <- c(0.1521739, 0.1521739, 0.1014493, 0.1014493, 0.1521739)

err_NBC_iono <- c(0.08571429, 0.07142857, 0.08571429, 0.05714286, 0.05633803)
err_NBC_car <- c(0.1184971, 0.1127168, 0.1589595, 0.1098266, 0.1482558)
err_NBC_crx <- c(0.1594203, 0.1449275, 0.0942029, 0.1376812, 0.1594203)

err_KNN_iono_k1 <- cbind(1:numFold, err_KNN_iono_k1)
err_KNN_car_k1 <- cbind(1:numFold, err_KNN_car_k1)
err_KNN_crx_k13 <- cbind(1:numFold, err_KNN_crx_k13)
err_NBC_iono <- cbind(1:numFold, err_NBC_iono)
err_NBC_car <- cbind(1:numFold, err_NBC_car)
err_NBC_crx <- cbind(1:numFold, err_NBC_crx)

cat("\014")

title <- "Errors for Ionosphere Set"
err_KNN <- err_KNN_iono_k1
err_NBC <- err_NBC_iono
yRange <- c(0, 0.25)
source("Prob4-Plot_Helper.R")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Boxplots
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())

err_KNN_iono_k1 <- c(0.08571429, 0.1, 0.05714286, 0.1, 0.07042254)
err_KNN_car_k1 <- c(0.09537572, 0.06647399, 0.06936416, 0.05202312, 0.05523256)
err_KNN_crx_k13 <- c(0.1521739, 0.1521739, 0.1014493, 0.1014493, 0.1521739)

err_NBC_iono <- c(0.08571429, 0.07142857, 0.08571429, 0.05714286, 0.05633803)
err_NBC_car <- c(0.1184971, 0.1127168, 0.1589595, 0.1098266, 0.1482558)
err_NBC_crx <- c(0.1594203, 0.1449275, 0.0942029, 0.1376812, 0.1594203)

title <- "Errors for Ionosphere Set"
err_twoMethods <- data.frame(cbind(err_KNN_iono_k1, err_NBC_iono))

title <- "Errors for Car Set"
err_twoMethods <- data.frame(cbind(err_KNN_car_k1, err_NBC_car))

title <- "Errors for Crx Set"
err_twoMethods <- data.frame(cbind(err_KNN_crx_k13, err_NBC_crx))

names(err_twoMethods) <- c("KNN", "NBC")
boxplot(err_twoMethods, 
        col = c("steelblue2", "orange"),
        main = title,
        ylab = "Error")

