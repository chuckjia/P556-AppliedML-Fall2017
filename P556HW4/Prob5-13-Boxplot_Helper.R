title <- paste("Comparison of Logit and KNN: Subset ", subsetNo, sep = "")
color_1 <- "steelblue2"
color_2 <- "orange"

par(fg = "black") 
par(mfrow = c(1, 1))
boxplot_this <- data.frame(cbind(err_logit_plot, err_KNN_plot))
names(boxplot_this) <- c("Logit", "KNN")
boxplot(boxplot_this, 
        col = c(color_1, color_2),
        main = title,
        ylab = "Error")

