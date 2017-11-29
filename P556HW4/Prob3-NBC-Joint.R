


folderPath <- "Data/KFold_NBC/"
source("Prob1-ReadKFold.R")
laplace_smooth_coef <- 1
err_NBC <- array(0, dim = numFold)

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
    
    if (numCatFeat < numFeat) {
        meta_cont <- !meta_cat
        numContFeat <- numFeat - numCatFeat
        mu <- matrix(ncol = numContFeat, nrow = numClasses)
        corMat <- array(dim = c(numClasses, numContFeat, numContFeat))
        for (i in 1:numClasses) {
            tmp <- tr_feat[tr_resp == classes[i], meta_cont]
            mu[i,] <- colMeans(tmp)
            corMat[i,,] <- cor(tmp)
        }
        for (j in 1:numVldData) 
            for (i in 1:numClasses)
                lk[j, i] <- lk[j, i] * dmvnorm(vld_feat[j, meta_cont], mean = mu[i,], sigma = corMat[i,, ])
    }
    
    for (featNo in 1:numFeat) {
        if (meta_cat[featNo]) {  # Categorical variable
            uniqVals <- unique(tr_feat[,featNo]) 
            numUniqVals <- length(uniqVals)
            freq <- data.frame(matrix(0, ncol = numClasses, nrow = numUniqVals))
            names(freq) <- classes
            row.names(freq) <- uniqVals
            for (i in 1:numClasses) {
                tmp <- tr_feat[tr_resp == classes[i], featNo]
                len_tmp <- length(tmp)
                for (j in 1:numUniqVals) 
                    freq[j, i] <- (sum(tmp == uniqVals[j]) + laplace_smooth_coef * prior[i]) / (len_tmp + laplace_smooth_coef)
            }
            for (i in 1:numVldData) 
                lk[i,] <- lk[i,] * freq[as.character(vld_feat[i, featNo]),]
        }
    }
    label <- array(NA, dim = numVldData)
    for (i in 1:numVldData) 
        label[i] <- names(which.max(lk[i,]))
    err_NBC[foldNo] <- 1 - sum(label == vld_resp) / numVldData
}

cat("Average error rate is ", mean(err_NBC), "\n", sep = "")







