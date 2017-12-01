# Prob2-KNN_Wrapper.R: Wrapper file for applying the KNN algorithm on cross-validation files

# Choose KNN method 
KNN_FILE <- "Prob2-KNN-MajorVoting.R"
if (KNN_method == "R_KNN") {
    KNN_FILE <- "Prob2-R_KNN.R"
} else if (KNN_method == "R_KNNCAT") {
    KNN_FILE <- "Prob2-R_KNNCAT.R"
} else if (KNN_method == "myKNN_DistWeight") {
    KNN_FILE <- "Prob2-KNN-DistWeightVoting.R"
}

# Choose distance function
KNN_Helper_CalcDist_FILE <- "Prob2-KNN_Helper-CalcDist-1Norm.R"
if (dist_fcn_name == "2-norm")
    KNN_Helper_CalcDist_FILE <- "Prob2-KNN_Helper-CalcDist-2Norm.R"

# Choose data source
folderPath <- "Data/KFold_KNN/"
if (KNN_method == "R_KNNCAT") 
    folderPath <- "Data/KFold/"

# Read data sets from file
source("Prob1-ReadKFold.R")

errAll_KNN <- data.frame(matrix(0, ncol = length(neighborRange), nrow = numFold))
names(errAll_KNN) <- neighborRange
row.names(errAll_KNN) <- paste("Fold_", 1:numFold, sep = "")

for (numNeighbor in neighborRange) {
    source(KNN_FILE)
    errAll_KNN[,which(neighborRange == numNeighbor)] <- err_vec
}

rm(numNeighbor, err_vec)
