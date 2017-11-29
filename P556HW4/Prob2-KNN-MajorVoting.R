# Prob2-KNN-MajorVoting.R: Perform KNN algorithm with majority voting method
# Perform KNN algorithm on k-fold cross-validation data sets, using majority voting method

# Read data sets from file
folderPath <- "Data/KFold_KNN/"
source("Prob1-ReadKFold.R")

err_vec <- array(0, dim = numFold)

for (foldNo in 1:numFold) {
    tr_feat <- tr_feat_list[[foldNo]]
    vld_feat <- vld_feat_list[[foldNo]]
    tr_resp <- tr_resp_list[[foldNo]]
    vld_resp <- vld_resp_list[[foldNo]]
    
    numData_vld <- nrow(vld_feat)
    vld_pred <- data.frame(matrix(NA, ncol = 1, nrow = numData_vld))
    names(vld_pred) <- names(vld_resp)
    row.names(vld_pred) <- row.names(vld_resp)
    
    for (j in 1:numData_vld) {
        dataPt <- vld_feat[j,]
        source("Prob2-KNN_Helper-CalcDist-1Norm.R")
        cand_names <- names(allDist)[allDist <= allDist[numNeighbor]]
        freqTable <- table(tr_resp[cand_names,])
        vld_pred[j,] <- names(freqTable)[which.max(freqTable)]
    }
    
    # Calculate the error rate
    err_vec[foldNo] <- 1 - sum(vld_pred == vld_resp) / numData_vld
}

cat("With ", numNeighbor, " neighbors, average error = ", mean(err_vec), "\n", sep = "")

rm(j, numData_vld, tr_feat, vld_feat, tr_resp, vld_resp, vld_pred, dataPt, allDist, cand_names, 
   foldNo, folderPath, freqTable)


