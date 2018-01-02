# ===== ===== ===== ===== ===== ===== ===== ===== #
# Parameters
# ===== ===== ===== ===== ===== ===== ===== ===== #

ptm <- proc.time()
# May be set in other files
# kRange <- 2:3
# numRuns <- 5
# maxItr <- 100
# tol <- 1e-4
# randGen = c(100, 10000)

# ===== ===== ===== ===== ===== ===== ===== ===== #
# Read data sources
# ===== ===== ===== ===== ===== ===== ===== ===== #

# Ionosphere data
filename = paste(FolderPath, "DataFiles/ionosphere.data", sep = "")
obs <- read.table(filename, sep = ",")
numCol <- dim(obs)[2]
classRes <- data.matrix(obs[, numCol])  # Classification results
numCol <- numCol - 1
obs <- data.matrix(obs[, 1:numCol])
label1 <- "g"
label2 <- "b"
trueCenter1 <- colMeans(obs[classRes == label1, ])
trueCenter2 <- colMeans(obs[classRes == label2, ])
obs = obs[, 3:numCol]

n <- nrow(obs); d <- ncol(obs)  # Parameters from data
obst <- t(obs)

# ===== ===== ===== ===== ===== ===== ===== ===== #
# Run EM
# ===== ===== ===== ===== ===== ===== ===== ===== #

cat("===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \n")
cat("~ Running EM With Fixed Priors and Covs on Ionosphere Data\n", sep = "")
cat("  - maxItr = ", maxItr, ", tol = ", tol, "\n", sep = "")
cat("===== ===== ===== ===== ===== ===== ===== ===== ===== ===== \n")

totalErrRateMat = matrix(0, nrow = numRuns, ncol = length(kRange))
numItrMat = matrix(0, nrow = numRuns, ncol = length(kRange))

fileNameEMFixed = paste(FolderPath, "Prob3-EMFixed-SingleRun.R", sep = "")
fileNameCalcRates = paste(FolderPath, "Prob3-EM-CalcErrRates.R", sep = "")
for (k in kRange) 
    for (runNo in 1:numRuns) {
        cat("\n~ k = ", k, " | run no. ", runNo, "\n", sep = "")
        source(fileNameEMFixed)
        source(fileNameCalcRates)
        totalErrRateMat[runNo, k - 1] = totalErrRate
        numItrMat[runNo, k - 1] = itr
    }
cat("\n\nTotal Error Rates Matrix\n")
print(totalErrRateMat)
cat("\nNumber of Iterations Matrix\n")
print(numItrMat)

if (controlInit) {
    errFileName = "Prob3_EMFixed_Ionosphere_ErrRes.RData"
    itrNumFileName = "Prob3_EMFixed_Ionosphere_ItrRes.RData"
    fileName = paste(FolderPath, "Prob3-SaveRes.R", sep = "")
    source(fileName)
}

timeUsed <- proc.time() - ptm
cat("\nTime used\n  - Total User = ", timeUsed[1], "System CPU = ", timeUsed[2],"Elapsed = ", timeUsed[3])



