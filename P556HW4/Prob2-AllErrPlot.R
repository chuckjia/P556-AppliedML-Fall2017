# Prob2-AllErrPlot.R: Make boxplots on errors
# Input:: errAll_KNN, neighborRange

par(fg = "black") 
title <- paste(toupper(data_set_name), " Set with ", dist_fcn_name, " Dist Function", sep = "")
boxplot(errAll_KNN[,neighborRange],
        main = title,
        xlab = "Number of Neighbors",
        ylab = "Errors",
        col = "steelblue2")
