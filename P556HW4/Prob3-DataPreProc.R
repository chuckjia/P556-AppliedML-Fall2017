# Prob2-DataPreProc.R: Preprocess data in the 3 data sets

rm(list = ls()); cat("\014")  # Clear screen

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Ionosphere data sets
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====

# Settings
numFold <- 5
data_set_name <- "ionosphere"
set.seed(20)

# Read data set from file
data_set <- read.table(paste("Data/", data_set_name, ".data", sep = ""), sep = ",")
data_set <- subset(data_set, select = -V2)  # Drop feature V2
# Create train and validation files
source("Prob1-CreateFiles.R")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Car data sets
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====

# - All categorical variables
# - No missing data

# Settings
numFold <- 5
data_set_name <- "car"
set.seed(20)

# Read data set from file
data_set <- read.table(paste("Data/", data_set_name, ".data", sep = ""), sep = ",", 
                       stringsAsFactors = F)
feat_set <- subset(data_set, select = -ncol(data_set))
resp <- data.frame(subset(data_set, select = ncol(data_set)))
dummy_set <- resp
numFeat <- ncol(feat_set)
featNames <- names(feat_set)

for (j in 1:numFeat) 
    dummy_set <- cbind(dummy_set, dummy(featNames[j], data = feat_set, sep = "_v_"))
data_set <- cbind(subset(dummy_set, select = -1), resp)
source("Prob1-CreateFiles.R")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Crx data sets
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====

# - Mixed variable types
# - Including missing data

# Settings
numFold <- 5
data_set_name <- "crx"
set.seed(20)

# Read data set from file
data_set <- read.table(paste("Data/", data_set_name, ".data", sep = ""), sep = ",", stringsAsFactors = F)
names(data_set) <- c("A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12", "A13", "A14", "A15", "A16")

# Missing data
data_set$A1[data_set$A1 == "?"] <- "b"  # Substitue with the most frequent value
data_set$A2[data_set$A2 == "?"] <- mean(as.numeric(data_set$A2[data_set$A2 != "?"]))  # Substitue with mean
data_set$A2 <- as.numeric(data_set$A2)
data_set$A4[data_set$A4 == "?"] <- "u"  # Substitue with the most frequent value
data_set$A5[data_set$A5 == "?"] <- "g"  # Substitue with the most frequent value
data_set$A6[data_set$A6 == "?"] <- "c"  # Substitue with the most frequent value
data_set$A7[data_set$A7 == "?"] <- "v"  # Substitue with the most frequent value
data_set$A14[data_set$A14 == "?"] <- mean(as.numeric(data_set$A14[data_set$A14 != "?"]))
data_set$A14 <- as.numeric(data_set$A14)

feat_set <- subset(data_set, select = -ncol(data_set))
resp <- data.frame(subset(data_set, select = ncol(data_set)))
dummy_set <- resp
numFeat <- ncol(feat_set)
featNames <- names(feat_set)

# Data type
meta_cat <- array(T, dim = ncol(data_set))
names(meta_cat) <- names(data_set)
meta_cat[c(2, 3, 8, 11, 14, 15)] <- F

for (j in 1:numFeat) {
    if (meta_cat[j])
        dummy_set <- cbind(dummy_set, dummy(featNames[j], data = feat_set, sep = "_v_"))
    else 
        dummy_set <- cbind(dummy_set, scale(subset(feat_set, select = j), center = T, scale = T))
}
data_set <- cbind(subset(dummy_set, select = -1), resp)
source("Prob1-CreateFiles.R")


