# rm(list = ls())
# fileName = "ringTotalErr.Rdata"
# fileName = "ionoTotalErr.Rdata"
# folderPath = "/Users/chuckjia/Desktop/P556 - HW1/Results/"
# fullPath = paste(folderPath, fileName, sep = "")
#  
# save(totalErrorMat, file = fullPath)

# load(fullPath)

totalErrorMat = t(totalErrorMat)

totalNumRuns = dim(totalErrorMat)[1]
sizeBtRuns = 0.4 / totalNumRuns
plot(1, type="n", main = "Ringnorm Total Error Rates", xlab="Number of Clusters (k)", ylab="Total Error Rates", xlim=c(1.5, 5.5), ylim=c(0, 1.5))
colorVec = c("darkgreen", "orange", "darkblue", "red")
for (j in 1:4) {
    fromIndex <- j + 1 - 0.2
    toIndex <- fromIndex + sizeBtRuns * (totalNumRuns - 1)
    augMat <- seq(from = fromIndex, to = toIndex, by = sizeBtRuns)
    plotPoints = cbind(augMat, totalErrorMat[ , j])
    points(plotPoints, col = colorVec[j], pch = 21)
}

