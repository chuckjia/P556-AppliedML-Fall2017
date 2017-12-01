# Prob3-PlotErr.R: Plot the errors from the Naive Bayes Classifier method

title <- "Errors From the Naive Bayes Classifier Method"

color_vec <- c("steelblue2", "orange", "darkgreen")

par(fg = "black") 

pts <- cbind(1:numFold, err_NBC_iono)
plot(pts,
     type = "l",
     lwd = 2, 
     col = color_vec[1],
     main = title,
     ylim = yRange,
     xlab = "Validation Set Number",
     ylab = "Error")
points(pts, col = color_vec[1], pch = 19)

pts <- cbind(1:numFold, err_NBC_car)
lines(pts, col = color_vec[2], lwd = 2)
points(pts, col = color_vec[2], pch = 19)

pts <- cbind(1:numFold, err_NBC_crx)
lines(pts, col = color_vec[3], lwd = 2)
points(pts, col = color_vec[3], pch = 19)

legend(1, yRange[2],
       c("Ionosphere", "Car", "Crx"),
       lty = c(1, 1, 1),
       lwd = c(2.5, 2.5, 2.5),
       col = color_vec)

if (plot_R_res) {
    pts <- cbind(1:numFold, err_RNBC_iono)
    lines(pts, col = color_vec[1], lty = 2, lwd = 2)
    points(pts, col = color_vec[1], pch = 19)
    
    pts <- cbind(1:numFold, err_RNBC_car)
    lines(pts, col = color_vec[2], lty = 2, lwd = 2)
    points(pts, col = color_vec[2], pch = 19)
    
    pts <- cbind(1:numFold, err_RNBC_crx)
    lines(pts, col = color_vec[3], lty = 2, lwd = 2)
    points(pts, col = color_vec[3], pch = 19)
}

