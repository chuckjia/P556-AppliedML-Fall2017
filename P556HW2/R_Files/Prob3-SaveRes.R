subfolderPath = "Results/"
fullPath = paste(FolderPath, subfolderPath, errFileName, sep = "")
save(totalErrRateMat, file = fullPath)
fullPath = paste(FolderPath, subfolderPath, itrNumFileName, sep = "")
save(numItrMat, file = fullPath)
cat("\nSuccessfully saved results to files.\n")