par(fg = "black") 
plot(err_KNN,
     type = "l",
     lwd = 2, 
     col = "steelblue2",
     ylim = yRange,
     main = title,
     xlab = "Validation Set Number",
     ylab = "Error")
points(err_KNN, col = "steelblue2", pch = 19)
lines(err_NBC, col = "orange", lwd = 2)
points(err_NBC, col = "orange", pch = 19)
legend(1, yRange[2],
       c("KNN", "Naive Bayes"),
       lty = c(1, 1),
       lwd = c(2, 2),
       col = c("steelblue2", "orange"))