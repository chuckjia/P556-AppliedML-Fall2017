# Prob1-DataPreProc.R: Preprocess data in the 3 data sets
# This scripts preprocess data in the data sets. We focus on dropping missing values. Since only the
# Crx data set has missing data, we only process this one data set here.

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

sum(data_set == "?")

source("Prob1-CreateFiles.R")

