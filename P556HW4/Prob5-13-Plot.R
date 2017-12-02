# Prob5-13-Plot.R: Make plots for comparison of logistic regression and KNN

rm(list = ls())

# Logit error results
err_logit_0 <- c(0.1089109, 0.1485149, 0.1089109, 0.1386139, 0.06862745)
err_logit_1 <- c(0.1980198, 0.2079208, 0.1188119, 0.1881188, 0.04901961)
err_logit_2 <- c(0.1386139, 0.1782178, 0.1881188, 0.2079208, 0.1666667)
err_logit_3 <- c(0.1683168, 0.2079208, 0.1980198, 0.2079208, 0.1666667)
err_logit_4 <- c(0.2277228, 0.3069307, 0.2277228, 0.2673267, 0.1568627)
err_logit_5 <- c(0.3267327, 0.4356436, 0.2475248, 0.3168317, 0.3431373)

# KNN error results
err_KNN_0 <- c(0.05940594, 0.06930693, 0.07920792, 0.08910891, 0.05882353)
err_KNN_1 <- c(0.1386139, 0.1287129, 0.1683168, 0.1584158, 0.1568627)
err_KNN_2 <- c(0.03960396, 0.1287129, 0.1188119, 0.07920792, 0.04901961)
err_KNN_3 <- c(0.05940594, 0.05940594, 0.1089109, 0.06930693, 0.04901961)
err_KNN_4 <- c(0.01980198, 0.04950495, 0.07920792, 0.07920792, 0)
err_KNN_5 <- c(0.05940594, 0.1089109, 0.07920792, 0.1386139, 0.03921569)
cat("\014")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Plotting
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

subsetNo <- 0
err_logit_plot <- err_logit_0
err_KNN_plot <- err_KNN_0
yRange <- c(0, 0.55)

filename <- paste("Plots/Prob5-13-Plot-Subset", subsetNo, ".pdf", sep = "")
pdf(file = filename, width = 9, height = 6)
source("Prob5-13-Plot_Helper.R")
dev.off()

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Boxplots
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

subsetNo <- 5
err_logit_plot <- err_logit_5
err_KNN_plot <- err_KNN_5

filename <- paste("Plots/Prob5-13-Boxplot-Subset", subsetNo, ".pdf", sep = "")
pdf(file = filename, width = 5, height = 5)
source("Prob5-13-Boxplot_Helper.R")
dev.off()





