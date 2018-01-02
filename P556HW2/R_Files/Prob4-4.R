# ===== ===== ===== ===== ===== ===== ===== ===== 
# Problem 4.4
# ===== ===== ===== ===== ===== ===== ===== ===== 
# Ringnorm data
rm(list = ls())
obs <- data.matrix(read.csv("/Users/chuckjia/Desktop/P556 - HW2/DataFiles/ringnorm_data.csv", header = FALSE))
numCol = dim(obs)[2]
obs <- obs[ ,2:numCol]

# Ionosphere data
rm(list = ls())
obs <- read.table("/Users/chuckjia/Desktop/P556 - HW2/DataFiles/ionosphere.data", sep = ",")
numCol = dim(obs)[2]
obs <- data.matrix(obs[ , 1:numCol - 1])

pca <- prcomp(obs)
summary(pca)
proportionVar <- pca$sdev^2 / sum(pca$sdev^2)
sum(proportionVar[1:18])  # %90 at PC18 for both Ringnorm and Ionosphere
obsPCA = pca$x[, 1:18]

# ===== ===== ===== ===== ===== ===== ===== ===== 
# EM on Ringnorm data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-6
source(paste(FolderPath, "Prob4-EM-Wrapper-Ringnorm.R", sep = ""))

# ===== ===== ===== ===== ===== ===== ===== ===== 
# EM on Ionosphere data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-5
source(paste(FolderPath, "Prob4-EM-Wrapper-Ionosphere.R", sep = ""))

# ===== ===== ===== ===== ===== ===== ===== ===== 
# kmeans with PCA on Ringnorm data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = FALSE; randGen = c(100, 10000); saveFile = TRUE
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-5
source(paste(FolderPath, "Prob4-kmeans-Wrapper-Ringnorm.R", sep = ""))

# ===== ===== ===== ===== ===== ===== ===== ===== 
# kmeans on Ionosphere data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-5
source(paste(FolderPath, "Prob4-kmeans-Wrapper-Ionosphere.R", sep = ""))



