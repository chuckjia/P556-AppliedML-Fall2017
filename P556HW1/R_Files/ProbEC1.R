# ===== ===== ===== ===== ===== ===== ===== ===== ===== =====
# This file contains R code to pre-process data from the 
# Breast Cancer Wisconsin Data Set used in Problem EC1.
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
obs <- read.table("/Users/chuckjia/Desktop/P556 - HW1/DataFiles/breast-cancer-wisconsin.data", sep = ",")
numRow = dim(obs)[1]
numCol = dim(obs)[2]

# Delete incomplete data points
keep = matrix(TRUE, nrow = numRow, ncol = 1)
for (i in 1:numRow) 
    for (j in 1:numCol) 
        if (obs[i, j] == "?") {
            keep[i] = FALSE
            break
        }
obs <- obs[keep, ]
# Number of rows in obs is changed
numRow = dim(obs)[1]
classRes <- data.matrix(obs[ ,numCol])  # Classification results
obs <- data.matrix(obs[ , 1:numCol - 1])

label1 = 2
label2 = 4



