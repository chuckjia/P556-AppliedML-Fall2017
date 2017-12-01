# Prob2-Plots.R: This script plots the results of the KNN algorithm
# Inputs:: neighborRange, errAll_KNN

title <- paste(toupper(data_set_name), " Set with ", dist_fcn_name, " Dist Function", sep = "")

err_pts <- cbind(neighborRange, colMeans(errAll_KNN))
err_sd <- apply(errAll_KNN, 2, sd)

if (is.null(yRange)) 
    yRange <- c(min(err_pts[,2] - 1.25 * err_sd), 
                max(err_pts[,2] + 1.25 * err_sd))

par(fg = "black") 
plot(err_pts,
     type = "l",
     lwd = 2, 
     col = "steelblue2",
     ylim = yRange,
     main = title,
     xlab = "Number of Neighbors",
     ylab = "Error")

par(fg = "steelblue2") 
errbar(err_pts[,1], err_pts[,2], 
       err_pts[,2] + err_sd, 
       err_pts[,2] - err_sd, 
       add = TRUE,
       col = "steelblue2", 
       pch = 19, 
       lwd = 0.75)

rm(title, err_pts, err_sd)

