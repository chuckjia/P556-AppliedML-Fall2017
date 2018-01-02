SSEMat = t(SSEMat)

totalNumRuns = dim(SSEMat)[1]
sizeBtRuns = 0.4 / totalNumRuns
plot(1, type="n", main = "Breast Cancer Winsconsin SSE", xlab="Number of Clusters (k)", ylab="SSE", xlim=c(1.5, 5.5), ylim=c(0, 2.3e14))
colorVec = c("darkgreen", "orange", "darkblue", "red")
for (j in 1:4) {
    fromIndex <- j + 1 - 0.2
    toIndex <- fromIndex + sizeBtRuns * (totalNumRuns - 1)
    augMat <- seq(from = fromIndex, to = toIndex, by = sizeBtRuns)
    plotPoints = cbind(augMat, SSEMat[ , j])
    points(plotPoints, col = colorVec[j], pch = 21)
}

