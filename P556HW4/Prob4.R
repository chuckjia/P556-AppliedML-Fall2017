numFold <- 5
err_KNN_iono_k2 <- c(0.08571429, 0.10000000, 0.05714286, 0.10000000, 0.07042254)
err_KNN_car_k12 <- c(0.11271676, 0.09248555, 0.09537572, 0.07225434, 0.06976744)
err_KNN_crx_k13 <- c(0.1521739, 0.1521739, 0.1014493, 0.1014493, 0.1521739)

err_NBC_iono <- c(0.1714286, 0.1714286, 0.1857143, 0.2142857, 0.1267606)
err_NBC_car <- c(0.1445087, 0.1473988, 0.1647399, 0.1184971, 0.1744186)
err_NBC_crx <- c(0.2391304, 0.2028986, 0.1666667, 0.2463768, 0.2536232)

err_KNN_iono_k2 <- cbind(1:numFold, err_KNN_iono_k2)
err_KNN_car_k12 <- cbind(1:numFold, err_KNN_car_k12)
err_KNN_crx_k13 <- cbind(1:numFold, err_KNN_crx_k13)
err_NBC_iono <- cbind(1:numFold, err_NBC_iono)
err_NBC_car <- cbind(1:numFold, err_NBC_car)
err_NBC_crx <- cbind(1:numFold, err_NBC_crx)

title <- "Errors for Car Set"
err_KNN <- err_KNN_car_k12
err_NBC <- err_NBC_car
par(fg = "black") 
yRange <- c(0, 0.3)
plot(err_KNN,
     type = "l",
     lwd = 2, 
     col = "steelblue2",
     ylim = yRange,
     main = title,
     xlab = "Number of Neighbors",
     ylab = "Error")
points(err_KNN, col = "steelblue2", pch = 19)
lines(err_NBC, col = "orange", lwd = 2)
points(err_NBC, col = "orange", pch = 19)
legend(1, 0.3,
       c("KNN", "Naive Bayes"),
       lty = c(1, 1),
       lwd = c(2, 2),
       col = c("steelblue2", "orange"))

















