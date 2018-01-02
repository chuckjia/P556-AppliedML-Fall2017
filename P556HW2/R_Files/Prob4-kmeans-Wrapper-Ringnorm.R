# ===== ===== ===== ===== ===== ===== ===== ===== #
# Parameters
# ===== ===== ===== ===== ===== ===== ===== ===== #

ptm <- proc.time()
# May be set in other files
# kRange <- 2:2
# numRuns <- 5
# maxItr <- 100
# tol <- 1e-5
# randGen = c(100, 10000)

# ===== ===== ===== ===== ===== ===== ===== ===== #
# Read data sources
# ===== ===== ===== ===== ===== ===== ===== ===== #

# Ringnorm data
filename = paste(FolderPath, "DataFiles/ringnorm_data.csv", sep = "")
obs <- data.matrix(read.csv(filename, header = FALSE))
numCol = dim(obs)[2]
classRes <- obs[ ,1]
obs <- obs[ ,2:numCol]
label1 = 1
label2 = -1
trueCenter1 <- colMeans(obs[classRes == label1, ])
trueCenter2 <- colMeans(obs[classRes == label2, ])

# Do PCA and keep 90% of variances
pca <- prcomp(obs)
obs = pca$x[, 1:18]

n <- nrow(obs); d <- ncol(obs)  # Parameters from data
obst <- t(obs)

# ===== ===== ===== ===== ===== ===== ===== ===== #
# Run kmeans
# ===== ===== ===== ===== ===== ===== ===== ===== #

cat("===== ===== ===== ===== ===== ===== \n")
cat("~ Running k-Means on Ringnorm Data\n", sep = "")
cat("  - maxItr = ", maxItr, ", tol = ", tol, "\n", sep = "")
cat("===== ===== ===== ===== ===== ===== \n")

totalErrRateMat = matrix(0, nrow = numRuns, ncol = length(kRange))
numItrMat = matrix(0, nrow = numRuns, ncol = length(kRange))

fileNameEM = paste(FolderPath, "Prob3-kmeans-SingleRun.R", sep = "")
fileNameCalcRates = paste(FolderPath, "Prob3-kmeans-CalcErrRates.R", sep = "")
for (k in kRange) 
    for (runNo in 1:numRuns) {
        cat("\n~ k = ", k, " | run no. ", runNo, "\n", sep = "")
        source(fileNameEM)
        source(fileNameCalcRates)
        totalErrRateMat[runNo, k - kRange[1] + 1] = totalErrRate
        numItrMat[runNo, k - kRange[1] + 1] = itr - 1
    }
cat("\n\nTotal Error Rates Matrix\n")
print(totalErrRateMat)
cat("\nNumber of Iterations Matrix\n")
print(numItrMat)

if (saveFile) {
    errFileName = "Prob4_kmeansPCA_Ringnorm_ErrRes.RData"
    itrNumFileName = "Prob4_kmeansPCA_Ringnorm_ItrRes.RData"
    fileName = paste(FolderPath, "Prob3-SaveRes.R", sep = "")
    source(fileName)
}

timeUsed <- proc.time() - ptm
cat("\nTime used\n  - Total User = ", timeUsed[1], "System CPU = ", timeUsed[2],"Elapsed = ", timeUsed[3])

