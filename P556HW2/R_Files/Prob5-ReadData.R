filename = paste(FolderPath, "DataFiles/ionosphere.data", sep = "")
obs <- read.table(filename, sep = ",")
numCol <- dim(obs)[2]
classRes <- data.matrix(obs[, numCol])  # Classification results
numCol <- numCol - 1
obs <- data.matrix(obs[, 1:numCol])
label1 <- "g"
label2 <- "b"

totalNumRows = nrow(obs)
listSelected = sample(totalNumRows, size = 50, replace = FALSE)
obsSelected = obs[listSelected,]