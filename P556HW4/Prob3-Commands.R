rm(list = ls())
cat("\014")  # Clear screen

# Set number of folds
numFold <- 5

# Set data set name
data_set_name <- "ionosphere"; meta_cat <- array(F, dim = 33); meta_cat[1] <- T
data_set_name <- "car"; meta_cat <- array(T, dim = 21)
data_set_name <- "crx"; meta_cat <- array(T, dim = 46); meta_cat[c(3,4,34,39,45,46)] <- F
# meta_cat <- array(T, dim = 15); meta_cat[c(2,3,8,11,14,15)] <- F

# Run naive Bayes from our implementation
source("Prob3-NBC_Wrapper-Joint.R")

# Run naive Bayes from our implementation
source("Prob3-NBC-Marginal.R")

# Run naive Bayes from R built-in implementation
source("Prob3-R_NBC.R")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Plotting
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# cat(err_NBC, sep = ", ")
# cat(err_RNBC, sep = ", ")

err_NBC_iono <- c(0.08571429, 0.07142857, 0.08571429, 0.05714286, 0.05633803)
err_RNBC_iono <- c(0.1142857, 0.1142857, 0.1285714, 0.1142857, 0.05633803)

err_NBC_car <- c(0.1184971, 0.1127168, 0.1589595, 0.1098266, 0.1482558)
err_RNBC_car <- c(0.1358382, 0.132948, 0.1589595, 0.1156069, 0.1686047)

err_NBC_crx <- c(0.1594203, 0.1449275, 0.0942029, 0.1376812, 0.1594203)
err_RNBC_crx <- c(0.2318841, 0.2173913, 0.1884058, 0.2753623, 0.2608696)

# Old results
# err_NBC_iono <- c(0.1714286, 0.1714286, 0.1857143, 0.2142857, 0.1267606)
# err_NBC_car <- c(0.1445087, 0.1473988, 0.1647399, 0.1184971, 0.1744186)
# err_NBC_crx <- c(0.2391304, 0.2028986, 0.1666667, 0.2463768, 0.2536232)

yRange <- c(0.05, 0.22)
plot_R_res <- FALSE
source("Prob3-PlotErr.R")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Plot Comparison
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

data_set_name <- "crx"
yRange <- c(0.07, 0.35)
source("Prob3-Plot_R_Comp.R")












