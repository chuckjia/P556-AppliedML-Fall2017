# Prob2-R_KNNCAT.R: Perform KNN on cross validation files using the built-in KNNCAT methods in R

err_vec <- array(0, dim = numFold)

for (j in 1:numFold) {
    train_tmp <- cbind(tr_resp_list[[j]][,1], tr_feat_list[[j]])
    vld_tmp <- cbind(vld_resp_list[[j]][,1], vld_feat_list[[j]])
    names(train_tmp)[1] <- "classcol"
    names(vld_tmp)[1] <- "classcol"
    vld_pred <- knncat(train = train_tmp, 
                    test = vld_tmp, 
                    k = numNeighbor,
                    classcol = 1)
    
    err_vec[j] <- 1 - sum(diag(vld_pred$misclass.mat)) / sum(vld_pred$misclass.mat)
}

cat("With ", numNeighbor, " neighbors, average error rate = ", mean(err_vec), "\n", sep = "")

rm(j, vld_pred)