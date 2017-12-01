# Prob2-R_KNN.R: Perform KNN on cross validation files using the built-in KNN methods in R

err_vec <- array(0, dim = numFold)

for (j in 1:numFold) {
    vld_pred <- knn(train = tr_feat_list[[j]], 
        test =  vld_feat_list[[j]], 
        cl = tr_resp_list[[j]][,1], 
        k = numNeighbor)
    err_vec[j] <- 1 - sum(vld_pred == vld_resp_list[[j]][,1]) / nrow(vld_resp_list[[j]])
}

cat("With ", numNeighbor, " neighbors, average error rate = ", mean(err_vec), "\n", sep = "")

rm(j, vld_pred)
