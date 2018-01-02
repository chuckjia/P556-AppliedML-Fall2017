# Recluster to 2 clusters
labelMap <- array(1, dim = k)

if (k > 2) {
    for (labelNum in 1:k) {
        predCenter <- mu[, labelNum]
        dist1 <- norm(predCenter - trueCenter1, type = '2')
        dist2 <- norm(predCenter - trueCenter2, type = '2')
        if (dist2 < dist1)
            labelMap[k] <- 2
    }
} else {
    labelMap[2] = 2
}

# Count number of labels in each cluster
label1Count = c(0, 0)  # Count of label1 in 2 clusters: c(Count in Cluster1, Count in Cluster2)
label2Count = c(0, 0)  # Count of label2 in 2 clusters: c(Count in Cluster1, Count in Cluster2)
for (i in 1:n) {
    clusterNo = labelMap[label[i]]
    if (classRes[i] == label1) 
        label1Count[clusterNo] = label1Count[clusterNo] + 1
    else 
        label2Count[clusterNo] = label2Count[clusterNo] + 1
}

totalErrRate <- 0
for (clusterNo in 1:2) {
    label1CountCurr = label1Count[clusterNo] 
    label2CountCurr = label2Count[clusterNo]
    if (label1CountCurr >= label2CountCurr) 
        totalErrRate = totalErrRate + label2CountCurr / (label1CountCurr + label2CountCurr)
    else 
        totalErrRate = totalErrRate + label1CountCurr / (label1CountCurr + label2CountCurr)
}

cat("  - Total Error Rate = ", totalErrRate, sep = "")