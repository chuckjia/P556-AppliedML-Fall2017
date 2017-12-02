# Prob2-Commands.R: This script implements the KNN method and plot the errors

rm(list = ls())

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Settings
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

data_set_name <- "crx"  # ionosphere | car | crx
dist_fcn_name <- "1-norm"
numFold <- 5
neighborRange <- 1:20
cat("\014")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# KNN
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

KNN_method <- "R_KNN"  # myKNN | R_KNN
source("Prob2-KNN_Wrapper.R")

# errAll_RKNN_Crx <- errAll_KNN
# save(errAll_RKNN_Crx, file = "Results/errAll_RKNN_Crx.RData")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Plotting
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# yRange <- c(0, 0.35)  # NULL for default y range in the graph
# source("Prob2-Plots.R")

# ----- ----- ----- ----- ----- ----- 
# Ionosphere set
# ----- ----- ----- ----- ----- ----- 

data_set_name <- "ionosphere"  
filename <- "errAll_KNN_Iono_1norm"
load(paste("Results/", filename, ".RData", sep = ""))
filename <- "errAll_KNN_Iono_2norm"
load(paste("Results/", filename, ".RData", sep = ""))
errAll_KNN_1 <- errAll_KNN_Iono_1norm
errAll_KNN_2 <- errAll_KNN_Iono_2norm
neighborRange <- 1:20

pdf(file = "Plots/Prob2-2-Prelim-Iono.pdf", width = 9, height = 5)
yRange <- c(0.05, 0.3)  # NULL for default y range in the graph
source("Prob2-PrelimPlots-Twin.R") 
dev.off()

dist_fcn_name <- "1-norm"
errAll_KNN <- errAll_KNN_1
pdf("Prob2-2-Iono-1norm.pdf", width = 9, height = 5)
neighborRange <- 1:5
source("Prob2-AllErrPlot.R") 
dev.off()

dist_fcn_name <- "2-norm"
errAll_KNN <- errAll_KNN_2
pdf("Prob2-2-Iono-2norm.pdf", width = 9, height = 5)
neighborRange <- 1:5
source("Prob2-AllErrPlot.R") 
dev.off()

colMeans(errAll_KNN)
min(colMeans(errAll_KNN))

# ----- ----- ----- ----- ----- ----- 
# Car set
# ----- ----- ----- ----- ----- ----- 

data_set_name <- "car"  
filename <- "errAll_KNN_Car_1norm"
load(paste("Results/", filename, ".RData", sep = ""))
filename <- "errAll_KNN_Car_2norm"
load(paste("Results/", filename, ".RData", sep = ""))
errAll_KNN_1 <- errAll_KNN_Car_1norm
errAll_KNN_2 <- errAll_KNN_Car_2norm
neighborRange <- 1:20

pdf(file = "Plots/Prob2-2-Prelim-Car.pdf", width = 9, height = 5)
yRange <- c(0.03, 0.25)  # NULL for default y range in the graph
source("Prob2-PrelimPlots-Twin.R") 
dev.off()

pdf(file = "Plots/Prob2-2-Car-1norm.pdf", width = 9, height = 5)
dist_fcn_name <- "1-norm"
errAll_KNN <- errAll_KNN_1
neighborRange <- 1:5
source("Prob2-AllErrPlot.R") 
dev.off()

pdf(file = "Plots/Prob2-2-Car-2norm.pdf", width = 9, height = 5)
dist_fcn_name <- "2-norm"
errAll_KNN <- errAll_KNN_2
neighborRange <- 1:5
source("Prob2-AllErrPlot.R") 
dev.off()

colMeans(errAll_KNN)
apply(errAll_KNN, 2, sd)

# ----- ----- ----- ----- ----- ----- 
# Crx set
# ----- ----- ----- ----- ----- ----- 

data_set_name <- "crx" 
filename <- "errAll_KNN_Crx_1norm"
load(paste("Results/", filename, ".RData", sep = ""))
filename <- "errAll_KNN_Crx_2norm"
load(paste("Results/", filename, ".RData", sep = ""))
errAll_KNN_1 <- errAll_KNN_Crx_1norm
errAll_KNN_2 <- errAll_KNN_Crx_2norm
neighborRange <- 1:20

pdf(file = "Plots/Prob2-2-Prelim-Crx.pdf", width = 9, height = 5)
yRange <- c(0.1, 0.3)  # NULL for default y range in the graph
source("Prob2-PrelimPlots-Twin.R") 
dev.off()

pdf(file = "Plots/Prob2-2-Crx-1norm.pdf", width = 9, height = 5)
dist_fcn_name <- "1-norm"
errAll_KNN <- errAll_KNN_1
neighborRange <- 11:15
source("Prob2-AllErrPlot.R") 
dev.off()

pdf(file = "Plots/Prob2-2-Crx-2norm.pdf", width = 9, height = 5)
dist_fcn_name <- "2-norm"
errAll_KNN <- errAll_KNN_2
neighborRange <- 11:15
source("Prob2-AllErrPlot.R") 
dev.off()

colMeans(errAll_KNN)
min(colMeans(errAll_KNN))
apply(errAll_KNN, 2, sd)









