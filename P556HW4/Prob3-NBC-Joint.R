# Prob3-NBC-Joint: Perform classification using the Naive Bayes Algorithm
# This script performs classification using the Naive Bayes Algorithm, with joint distribution from 
# continuous variables
# Input:: tr_feat_list, vld_feat_list, tr_resp_list, vld_resp_list
#         numFold
# Input:: CalcLikelihd_NBC_Helper_FILE: This is helper file that calculates the likelihood from 
#         continuous variables. It accomodates prior distributions in the model assumption.

laplace_smooth_coef <- 0

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
    
    numCatFeat <- sum(meta_cat)  # Number of categorical data
    
    # Updating likelihood using categorical variables
    for (featNo in 1:numFeat) {
        if (meta_cat[featNo]) {  
            uniqVals <- unique(tr_feat[,featNo]) 
            numUniqVals <- length(uniqVals)
            freq <- data.frame(matrix(0, ncol = numClasses, nrow = numUniqVals))
            names(freq) <- classes
            row.names(freq) <- uniqVals
            
            for (i in 1:numClasses) {
                tmp <- tr_feat[tr_resp == classes[i], featNo]
                len_tmp <- length(tmp)
                for (j in 1:numUniqVals) 
                    freq[j, i] <- (sum(tmp == uniqVals[j]) + laplace_smooth_coef * prior[i]) /
                    (len_tmp + laplace_smooth_coef)
            }
            for (i in 1:numVldData) 
                lk[i,] <- lk[i,] * freq[as.character(vld_feat[i, featNo]),]
        }
    }
    
    # Update likelihood using continuous variables
    if (numCatFeat < numFeat) {
        meta_cont <- !meta_cat
        numContFeat <- numFeat - numCatFeat
        mu <- matrix(ncol = numContFeat, nrow = numClasses)
        covMat <- array(dim = c(numClasses, numContFeat, numContFeat))
        
        source(CalcLikelihd_NBC_Helper_FILE)
        rm(mu, covMat, meta_cont, numContFeat)
    }
    
    # Make predictions based on likelihood
    label <- array(NA, dim = numVldData)
    for (i in 1:numVldData) 
        label[i] <- names(which.max(lk[i,]))
    err_NBC[foldNo] <- 1 - sum(label == vld_resp) / numVldData
}

cat("Average error rate is ", mean(err_NBC), "\n", sep = "")

rm(tr_feat, tr_resp, vld_feat, vld_resp, freq, lk, classes, featNo, foldNo, i, label, len_tmp, tmp,
   numCatFeat, numClasses, numTrData, numUniqVals, numVldData, prior, j, uniqVals)







