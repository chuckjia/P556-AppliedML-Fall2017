# ----- ----- ----- ----- ----- ----- 
# Ionosphere set
# ----- ----- ----- ----- ----- ----- 

data_set_name <- "ionosphere"  
filename <- "errAll_KNN_Iono_1norm"
load(paste("Results/", filename, ".RData", sep = ""))
filename <- "errAll_RKNN_Iono"
load(paste("Results/", filename, ".RData", sep = ""))
errAll_KNN_1 <- errAll_KNN_Iono_1norm
errAll_KNN_2 <- errAll_RKNN_Iono
neighborRange <- 1:20

pdf(file = "Plots/Prob2-2-R_Comp-Iono.pdf", width = 9, height = 5)
yRange <- c(0.05, 0.3)  # NULL for default y range in the graph
source("Prob2-PrelimPlots-Twin.R") 
dev.off()

# ----- ----- ----- ----- ----- ----- 
# Car set
# ----- ----- ----- ----- ----- ----- 

rm(list = ls())
data_set_name <- "car"  
filename <- "errAll_KNN_Car_1norm"
load(paste("Results/", filename, ".RData", sep = ""))
filename <- "errAll_RKNN_Car"
load(paste("Results/", filename, ".RData", sep = ""))
errAll_KNN_1 <- errAll_KNN_Car_1norm
errAll_KNN_2 <- errAll_RKNN_Car
neighborRange <- 1:20

pdf(file = "Plots/Prob2-2-R_Comp-Car.pdf", width = 9, height = 5)
yRange <- c(0.05, 0.25)  # NULL for default y range in the graph
source("Prob2-PrelimPlots-Twin.R") 
dev.off()

# ----- ----- ----- ----- ----- ----- 
# Crx set
# ----- ----- ----- ----- ----- ----- 

rm(list = ls())
data_set_name <- "crx"  
filename <- "errAll_KNN_Crx_1norm"
load(paste("Results/", filename, ".RData", sep = ""))
filename <- "errAll_RKNN_Crx"
load(paste("Results/", filename, ".RData", sep = ""))
errAll_KNN_1 <- errAll_KNN_Crx_1norm
errAll_KNN_2 <- errAll_RKNN_Crx
neighborRange <- 1:20

pdf(file = "Plots/Prob2-2-R_Comp-Crx.pdf", width = 9, height = 5)
yRange <- c(0.08, 0.3)  # NULL for default y range in the graph
source("Prob2-PrelimPlots-Twin.R") 
dev.off()

