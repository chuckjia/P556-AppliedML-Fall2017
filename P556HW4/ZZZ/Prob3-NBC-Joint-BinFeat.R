# Prob3-NBC-Joint: Perform classification using the Naive Bayes Algorithm
# This script performs classification using the Naive Bayes Algorithm, with joint distribution from 
# continuous variables. This file assumes all categorical features are dummy or binary variables.
# Input:: tr_feat_list, vld_feat_list, tr_resp_list, vld_resp_list
#         numFold
# 

folderPath <- "Data/KFold_NBC/"
source("Prob1-ReadKFold.R")
laplace_coef <- 0

err_NBC <- array(0, dim = numFold)  # Stores the errors from each cross validation set

for (foldNo in 1:numFold) {
    tr_feat <- tr_feat_list[[foldNo]]
    vld_feat <- vld_feat_list[[foldNo]]
    tr_resp <- tr_resp_list[[foldNo]]
    vld_resp <- vld_resp_list[[foldNo]]
    numFeat <- ncol(tr_feat)
    numTrData <- nrow(tr_feat)
    numVldData <- nrow(vld_feat)
    
    # Setting up classes and prior
    classes <- unique(tr_resp)[,1]
    numClasses <- length(classes)
    prior <- table(tr_resp)[classes] / numTrData
    
    # Setting up likelihood 
    lk <- data.frame(matrix(prior, ncol = numClasses, nrow = numVldData, byrow = T))
    names(lk) <- names(prior)
    row.names(lk) <- row.names(vld_feat)
    
    numCatFeat <- sum(meta_cat)
    
    for (featNo in 1:numFeat) {
        if (meta_cat[featNo]) {  # Categorical variable
            freq <- data.frame(matrix(0, ncol = numClasses, nrow = 2))
            names(freq) <- classes
            row.names(freq) <- c("0", "1")
            
            for (i in 1:numClasses) {
                tmp <- tr_feat[tr_resp == classes[i], featNo]
                len_tmp <- length(tmp)
                num_0 <- sum(tmp == 0)
                num_1 <- len_tmp - num_0
                freq["0", i] <- (num_0 + laplace_coef * prior[i]) / (len_tmp + laplace_coef)
                freq["1", i] <- (num_1 + laplace_coef * prior[i]) / (len_tmp + laplace_coef)
            }
            for (i in 1:numVldData) 
                lk[i,] <- lk[i,] * freq[vld_feat[i, featNo] + 1,]
        }
    }
    
    if (numCatFeat < numFeat) {
        meta_cont <- !meta_cat
        numContFeat <- numFeat - numCatFeat
        mu <- matrix(ncol = numContFeat, nrow = numClasses)
        covMat <- array(dim = c(numClasses, numContFeat, numContFeat))
        
        for (i in 1:numClasses) {
            tmp <- tr_feat[tr_resp == classes[i], meta_cont]
            mu[i,] <- colMeans(tmp)
            covMat[i,,] <- cor(tmp)
        }
        for (j in 1:numVldData) 
            for (i in 1:numClasses)
                lk[j, i] <- lk[j, i] * dmvnorm(vld_feat[j, meta_cont], 
                                               mean = mu[i,], sigma = covMat[i,,])
    }
    
    label <- array(NA, dim = numVldData)
    for (i in 1:numVldData) 
        label[i] <- names(which.max(lk[i,]))
    err_NBC[foldNo] <- 1 - sum(label == vld_resp) / numVldData
}

cat("Average error rate is ", mean(err_NBC), "\n", sep = "")







