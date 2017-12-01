folderPath <- "Data/KFold/"
source("Prob1-ReadKFold.R")
err_RNBC <- array(0, dim = numFold)

for (foldNo in 1:numFold) {
    mdl <- naive_bayes(tr_feat_list[[foldNo]], tr_resp_list[[foldNo]][,1], laplace = 0)
    res <- predict(mdl, vld_feat_list[[foldNo]])
    err_RNBC[foldNo] <- 1 - sum(res == vld_resp_list[[foldNo]][,1]) / nrow(vld_resp_list[[foldNo]])
}

cat("Average error rate is ", mean(err_RNBC), "\n", sep = "")




