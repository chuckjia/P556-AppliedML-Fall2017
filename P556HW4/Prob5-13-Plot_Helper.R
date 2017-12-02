title <- paste("Comparison of Logistic Regression and KNN: Subset ", subsetNo, sep = "")
color_1 <- "steelblue2"
color_2 <- "orange"

par(fg = "black") 
err_logit_pts <- cbind(1:5, err_logit_plot)
plot(err_logit_pts,
     type = "l",
     lwd = 2, 
     col = color_1,
     ylim = yRange,
     main = title,
     xlab = "Validation Set Number",
     ylab = "Error")
points(err_logit_pts, col = color_1, pch = 19)
err_KNN_pts <- cbind(1:5, err_KNN_plot)
lines(err_KNN_pts,
      type = "l",
      lwd = 2, 
      col = color_2)
points(err_KNN_pts, col = color_2, pch = 19)

legend(1, yRange[2],
       c("Logistic Regression", "KNN"),
       col = c(color_1, color_2),
       lty = c(1, 1),
       pch = c(19, 19))