# Prob2-Plots.R: This script plots the results of the KNN algorithm
# Inputs:: neighborRange, errAll_KNN

title <- paste(toupper(data_set_name), " Set", sep = "")

err_pts <- cbind(neighborRange, colMeans(errAll_KNN_1))
err_sd <- apply(errAll_KNN_1, 2, sd)
err_pts_2 <- cbind(neighborRange, colMeans(errAll_KNN_2))
err_sd_2 <- apply(errAll_KNN_2, 2, sd)

if (is.null(yRange)) 
    yRange <- c(min(err_pts[,2] - 1.25 * err_sd), 
                max(err_pts[,2] + 1.25 * err_sd))

color_1 <- "steelblue2"
color_2 <- "orange"

par(fg = "black") 
plot(err_pts,
     type = "l",
     lwd = 2, 
     col = color_1,
     ylim = yRange,
     main = title,
     xlab = "Number of Neighbors",
     ylab = "Error")
lines(err_pts_2,
     type = "l",
     lwd = 2, 
     col = color_2)

par(fg = "steelblue2") 
errbar(err_pts[,1], err_pts[,2], 
       err_pts[,2] + err_sd, 
       err_pts[,2] - err_sd, 
       add = TRUE,
       col = color_1, 
       pch = 19, 
       lwd = 0.75)

par(fg = "orange") 
errbar(err_pts_2[,1], err_pts_2[,2], 
       err_pts_2[,2] + err_sd_2, 
       err_pts_2[,2] - err_sd_2, 
       add = TRUE,
       col = color_2, 
       pch = 19, 
       lwd = 0.75)

rm(title, err_pts, err_sd, err_pts_2, err_sd_2)

