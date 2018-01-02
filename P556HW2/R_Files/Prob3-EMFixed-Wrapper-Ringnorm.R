# ===== ===== ===== ===== ===== ===== ===== ===== #
# Parameters
# ===== ===== ===== ===== ===== ===== ===== ===== #

ptm <- proc.time()
# May be set in other files
# kRange <- 2:3
# numRuns <- 2
# maxItr <- 50
# tol <- 1e-5
# randGen = c(100, 10000)
    
# ===== ===== ===== ===== ===== ===== #
# Read data sources
# ===== ===== ===== ===== ===== ===== #

# Ringnorm data
fileName = paste(FolderPath, "DataFiles/ringnorm_data.csv", sep = "")
obs <- data.matrix(read.csv(fileName, header = FALSE))
numCol = dim(obs)[2]
classRes <- obs[, 1]
obs <- obs[, 2:numCol]
label1 = 1
label2 = -1
trueCenter1 = colMeans(obs[classRes == label1, ])
trueCenter2 = colMeans(obs[classRes == label2, ])

n <- nrow(obs); d <- ncol(obs)  # Parameters from data
obst <- t(obs)

# ===== ===== ===== ===== ===== ===== ===== ===== #
# Run EM
# ===== ===== ===== ===== ===== ===== ===== ===== #

cat("===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \n")
cat("~ Running EM With Fixed Priors and Covs on Ringnorm Data\n", sep = "")
cat("  - maxItr = ", maxItr, ", tol = ", tol, "\n", sep = "")
cat("===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \n")

totalErrRateMat = matrix(0, nrow = numRuns, ncol = length(kRange))
numItrMat = matrix(0, nrow = numRuns, ncol = length(kRange))

fileNameEMFixed = paste(FolderPath, "Prob3-EMFixed-SingleRun.R", sep = "")
fileNameCalcErr = paste(FolderPath, "Prob3-EM-CalcErrRates.R", sep = "")
for (k in kRange) 
    for (runNo in 1:numRuns) {
        cat("\n~ k = ", k, " | run no. ", runNo, "\n", sep = "")
        source(fileNameEMFixed)
        source(fileNameCalcErr)
        totalErrRateMat[runNo, k - 1] = totalErrRate
        numItrMat[runNo, k - 1] = itr 
    }
cat("\n\nTotal Error Rates Matrix\n")
print(totalErrRateMat)
cat("\nNumber of Iterations Matrix\n")
print(numItrMat)

if (controlInit) {
    errFileName = "Prob3_EMFixed_Ringnorm_ErrRes.RData"
    itrNumFileName = "Prob3_EMFixed_Ringnorm_ItrRes.RData"
    fileName = paste(FolderPath, "Prob3-SaveRes.R", sep = "")
    source(fileName)
}

timeUsed <- proc.time() - ptm
cat("\nTime used\n  - Total User = ", timeUsed[1], "System CPU = ", timeUsed[2],"Elapsed = ", timeUsed[3])


