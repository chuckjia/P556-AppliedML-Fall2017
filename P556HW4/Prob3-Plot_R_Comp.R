color_vec <- c("steelblue", "orange")

if (data_set_name == "ionosphere") {
    err_NBC <- err_NBC_iono
    err_RNBC <- err_RNBC_iono
} else if (data_set_name == "car") {
    err_NBC <- err_NBC_car
    err_RNBC <- err_RNBC_car
} else if (data_set_name == "crx") {
    err_NBC <- err_NBC_crx
    err_RNBC <- err_RNBC_crx
}

title <- paste("Errors From the ", toupper(data_set_name), " Set", sep = "")
color_vec <- c("steelblue2", "orange")
par(fg = "black") 

pts <- cbind(1:numFold, err_NBC)
plot(pts,
     type = "l",
     lwd = 2, 
     col = color_vec[1],
     main = title,
     ylim = yRange,
     xlab = "Validation Set Number",
     ylab = "Error")
points(pts, col = color_vec[1], pch = 19)


pts <- cbind(1:numFold, err_RNBC)
lines(pts, col = color_vec[2], lty = 2, lwd = 2)
points(pts, col = color_vec[2], pch = 19)

legend(1, yRange[2],
       c("My Implementation", "R Built-in"),
       lty = c(1, 2),
       lwd = c(2.5, 2.5),
       col = color_vec)



