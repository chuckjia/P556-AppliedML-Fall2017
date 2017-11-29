# This file reads train sets and validation sets into a list of data frames

# Creating lists
tr_feat_list <- list()
vld_feat_list <- list()

# Read dataframes from files
for (j in 1:numFold) {
    # Training data
    filename <- paste(folderPath, data_set_name, "_train_", j, ".csv", sep = "")
    tr_feat_list[[j]] <- read.csv(filename, sep = ",", header = T, row.names = 1, stringsAsFactors = F)
    # Validation data
    filename <- paste(folderPath, data_set_name, "_valid_", j, ".csv", sep = "")
    vld_feat_list[[j]] <- read.csv(filename, sep = ",", header = T, row.names = 1, stringsAsFactors = F)
}

# Separating features from response 
numFeat <- ncol(tr_feat_list[[1]])
tr_resp_list <- list()
vld_resp_list <- list()
for (j in 1:numFold) {
    # Training 
    tr_resp_list[[j]] <- subset(tr_feat_list[[j]], select = numFeat)
    tr_feat_list[[j]] <- subset(tr_feat_list[[j]], select = -numFeat)
    # Validation
    vld_resp_list[[j]] <- subset(vld_feat_list[[j]], select = numFeat)
    vld_feat_list[[j]] <- subset(vld_feat_list[[j]], select = -numFeat)
}

rm(j, filename, numFeat)









