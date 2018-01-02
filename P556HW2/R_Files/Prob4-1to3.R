# ===== ===== ===== ===== ===== ===== #
# Problem 4.1
# ===== ===== ===== ===== ===== ===== #

# Ringnorm data
rm(list = ls())
obs <- data.matrix(read.csv("/Users/chuckjia/Desktop/P556 - HW2/DataFiles/ringnorm_data.csv", header = FALSE))
numCol = dim(obs)[2]
obs <- obs[ ,2:numCol]
mainTitle = "Scatter Plot of PC1 and PC2 from Ringnorm Data Set"

# Ionosphere data
rm(list = ls())
obs <- read.table("/Users/chuckjia/Desktop/P556 - HW2/DataFiles/ionosphere.data", sep = ",")
numCol = dim(obs)[2]
obs <- data.matrix(obs[ , 1:numCol - 1])
mainTitle = "Scatter Plot of PC1 and PC2 from Ionosphere Data Set"

# PC Analysis
pca <- prcomp(obs)
PC1 = pca$x[, "PC1"]
PC2 = pca$x[, "PC2"]
plot(cbind(PC1, PC2), 
     xlab = "PC1", ylab = "PC2", 
     main = mainTitle,
     col ="darkgreen", 
     pch = 21)  # Scatter plot


# ===== ===== ===== ===== ===== ===== ===== ===== 
# Problem 4.2
# ===== ===== ===== ===== ===== ===== ===== ===== 

# Ringnorm data
rm(list = ls())
obs <- data.matrix(read.csv("/Users/chuckjia/Desktop/P556 - HW2/DataFiles/ringnorm_data.csv", header = FALSE))
numCol = dim(obs)[2]
obs <- obs[ ,2:numCol]
mainTitle = "Scree Plot from Ringnorm Data Set"

# Ionosphere data
rm(list = ls())
obs <- read.table("/Users/chuckjia/Desktop/P556 - HW2/DataFiles/ionosphere.data", sep = ",")
numCol = dim(obs)[2]
obs <- data.matrix(obs[ , 1:numCol - 1])
mainTitle = "Scree Plot from Ionosphere Data Set"

# Screeplots: 2 types
pca <- prcomp(obs)
screeplot(pca, type = "lines", main = mainTitle)
screeplot(pca, type = "barplot", main = mainTitle)


