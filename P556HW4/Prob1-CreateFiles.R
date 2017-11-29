# Prob1-CreateFiles.R: Create k-fold cross validation files
# This script creates k pairs of train and validation sets. All of the train sets have similar sizes, 
# and all of the validation sets have similar sizes. 
# 
# Input:: data_set: The data set to be cross-validated
#         numFold: Number of folds to be used
#         data_set_name: The name of the data set
 
numData <- nrow(data_set)
numData_eachFold <- round(numData / numFold)

label <- 1:numData  # Used in the random sampling for each set
all_index <- 1:numData

for (foldNo in 1:(numFold - 1)) {
    valid_ind <- sort(sample(label, size = numData_eachFold, replace = F))
    label <- setdiff(label, valid_ind)
    source("Prob1-CreateFiles_Helper.R")
}
foldNo <- numFold
valid_ind <- label
source("Prob1-CreateFiles_Helper.R")

rm(numData, numData_eachFold, label, all_index, foldNo, valid_ind)


