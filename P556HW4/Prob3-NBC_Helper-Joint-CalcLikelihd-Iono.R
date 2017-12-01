
for (i in 1:numClasses) {
    tmp <- tr_feat[tr_resp == classes[i], meta_cont]
    mu[i,] <- colMeans(tmp)
    covMat[i,,] <- cor(tmp)
}
for (j in 1:numVldData) 
    for (i in 1:numClasses)
        lk[j, i] <- lk[j, i] * dmvnorm(vld_feat[j, meta_cont], 
                                       mean = mu[i,], sigma = covMat[i,,])
    
    
    
    
    
    
    
    
    