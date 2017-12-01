# Prob2-KNN-DistWeightVoting.R: Perform KNN algorithm with distance weighted voting method
# Perform KNN algorithm on k-fold cross-validation data sets, using distance weighted voting method

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
        source(KNN_Helper_CalcDist_FILE)
        
        cand_names <- names(allDist)[allDist <= allDist[numNeighbor]]
        uniqVal_cand <- unique(tr_resp[cand_names,])
        
        cand_scores <- data.frame(matrix(0, nrow = 1, ncol = length(uniqVal_cand)))
        names(cand_scores) <- uniqVal_cand
        
        for (candName in cand_names) {
            w <- 1 / sum((dataPt - tr_feat[candName,])^2)
            cand_scores[,tr_resp[candName,]] <- w + cand_scores[,tr_resp[candName,]]
        }
        
        vld_pred[j,] <- uniqVal_cand[which.max(cand_scores)]
    }
    
    # Calculate the error rate
    err_vec[foldNo] <- 1 - sum(vld_pred == vld_resp) / numData_vld
}

cat("With ", numNeighbor, " neighbors, average error = ", mean(err_vec), "\n", sep = "")

rm(j, numData_vld, tr_feat, vld_feat, tr_resp, vld_resp, vld_pred, dataPt, allDist, cand_names, foldNo)


