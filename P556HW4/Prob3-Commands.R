rm(list = ls())
cat("\014")  # Clear screen
numFold <- 5

data_set_name <- "ionosphere"; meta_cat <- array(F, dim = 33); meta_cat[1] <- T
data_set_name <- "car"; meta_cat <- array(T, dim = 6)
data_set_name <- "crx"; meta_cat <- array(T, dim = 15); meta_cat[c(2,3,8,11,14,15)] <- F

source("Prob3-NBC.R")
source("Prob3-NBC-Joint.R")
source("Prob3-R_NBC.R")

err_NBC_iono <- c(0.1714286, 0.1714286, 0.1857143, 0.2142857, 0.1267606)
err_NBC_car <- c(0.1445087, 0.1473988, 0.1647399, 0.1184971, 0.1744186)
err_NBC_crx <- c(0.2391304, 0.2028986, 0.1666667, 0.2463768, 0.2536232)

err_RNBC_iono <- c(0.11428571, 0.11428571, 0.12857143, 0.11428571, 0.05633803)
err_RNBC_car <- c(0.1358382, 0.1329480, 0.1589595, 0.1156069, 0.1686047)
err_RNBC_crx <- c(0.2318841, 0.2173913, 0.1884058, 0.2753623, 0.2608696)

err_iono <- err_RNBC_iono
err_car <- err_RNBC_car
err_crx <- err_RNBC_crx
# yRange <- c(0.1, 0.3)
 yRange <- c(0.05, 0.3)

title <- "Errors From the Built-in Naive Bayes Classifier Method"
par(fg = "black") 
pts <- cbind(1:numFold, err_iono)
plot(pts,
     type = "l",
     lwd = 2, 
     col = "steelblue2",
     main = title,
     ylim = yRange,
     xlab = "Validation Set Number",
     ylab = "Error")
points(pts, col = "steelblue2", pch = 19)

pts <- cbind(1:numFold, err_car)
lines(pts, col = "orange", lwd = 2)
points(pts, col = "orange", pch = 19)

pts <- cbind(1:numFold, err_crx)
lines(pts, col = "darkgreen", lwd = 2)
points(pts, col = "darkgreen", pch = 19)

legend(1, 0.3,
       c("Ionosphere", "Car", "Crx"),
       lty = c(1, 1, 1),
       lwd=c(2.5, 2.5, 2.5),
       col=c("steelblue2", "orange", "darkgreen"))

mean(err_RNBC_iono)






