# ===== ===== ===== ===== ===== ===== ===== ===== 
# EM on Ringnorm data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-6
source(paste(FolderPath, "Prob3-EM-Wrapper-Ringnorm.R", sep = ""))

# ===== ===== ===== ===== ===== ===== ===== ===== 
# EM on Ionosphere data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-5
source(paste(FolderPath, "Prob3-EM-Wrapper-Ionosphere.R", sep = ""))

# ===== ===== ===== ===== ===== ===== ===== ===== 
# Normal data tests for EM
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
source(paste(FolderPath, "Prob3-EM-NormDataTest.R", sep = ""))

# ===== ===== ===== ===== ===== ===== ===== ===== 
# Built-in EM tests 
# ===== ===== ===== ===== ===== ===== ===== =====

library(mclust)
mclustRes = Mclust(obs)
summary(mclustRes)
plot(mclustRes)

# ===== ===== ===== ===== ===== ===== ===== ===== 
# kmeans on Ringnorm data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-5
source(paste(FolderPath, "Prob3-kmeans-Wrapper-Ringnorm.R", sep = ""))

# ===== ===== ===== ===== ===== ===== ===== ===== 
# kmeans on Ionosphere data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-5
source(paste(FolderPath, "Prob3-kmeans-Wrapper-Ionosphere.R", sep = ""))

# ===== ===== ===== ===== ===== ===== ===== ===== 
# EM with fixed priors and covs on Ringnorm data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-6
source(paste(FolderPath, "Prob3-EMFixed-Wrapper-Ringnorm.R", sep = ""))


# ===== ===== ===== ===== ===== ===== ===== ===== 
# EM with fixed priors and covs on Ionosphere data set
# ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
FolderPath = "/Users/chuckjia/Desktop/P556 - HW2/"
controlInit = TRUE; randGen = c(100, 10000)
kRange <- 2:5; numRuns <- 20; maxItr <- 200; tol <- 1e-5
source(paste(FolderPath, "Prob3-EMFixed-Wrapper-Ionosphere.R", sep = ""))



#
set.seed(Sys.time())

