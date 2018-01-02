# ===== ===== ===== ===== ===== ===== #
# Read data sources
# ===== ===== ===== ===== ===== ===== #

# # Ringnorm data
# rm(list = ls())
# obs <- data.matrix(read.csv("/Users/chuckjia/Desktop/P556 - HW1/DataFiles/ringnorm_data.csv", header = FALSE))
# numCol = dim(obs)[2]
# classRes <- obs[ ,1]
# obs <- obs[ ,2:numCol]
# label1 = 1
# label2 = -1

# Ionosphere data
rm(list = ls())
obs <- read.table("/Users/chuckjia/Desktop/P556 - HW2/DataFiles/ionosphere.data", sep = ",")
numCol = dim(obs)[2]
classRes <- data.matrix(obs[ ,numCol])  # Classification results
obs <- data.matrix(obs[ , 1:numCol - 1])
label1 = "g"
label2 = "b"