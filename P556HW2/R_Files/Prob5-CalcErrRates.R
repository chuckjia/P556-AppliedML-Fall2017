# Count number of labels in each cluster
label1Count = c(0, 0)  # Count of label1 in 2 clusters: c(Count in Cluster1, Count in Cluster2)
label2Count = c(0, 0)  # Count of label2 in 2 clusters: c(Count in Cluster1, Count in Cluster2)
for (i in 1:50) {
    clusterNo = label[i]
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
print(totalErrRate)