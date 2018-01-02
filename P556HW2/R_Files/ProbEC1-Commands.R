# ===== ===== ===== ===== ===== ===== ===== ===== 
# EM with k-means++ on Ringnorm data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = FALSE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-6
source(paste(FolderPath, "ProbEC1-EM-Wrapper-Ringnorm.R", sep = ""))

# ===== ===== ===== ===== ===== ===== ===== ===== 
# EM with k-means++ on Ionosphere data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-6 
source(paste(FolderPath, "ProbEC1-EM-Wrapper-Ionosphere.R", sep = ""))
