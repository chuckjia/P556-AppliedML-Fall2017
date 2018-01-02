rm(list = ls())
n = 2e4
numElem = n * n
mat = matrix(1:numElem, ncol = n)
print(dim(mat))

ptm <- proc.time()
for (i in 1:n) {
    for (j in 1:n)
        mat[i, j] <- 2.1 * 3.3
}
timeUsed <- proc.time() - ptm
cat("Row first calculation:")
cat("Total User = ", timeUsed[1], "System CPU = ", timeUsed[2],"Elapsed = ", timeUsed[3])



ptm <- proc.time()
for (j in 1:n) {
    for (i in 1:n)
        mat[i, j] <- 2.1 * 3.3
}
timeUsed <- proc.time() - ptm
cat("Column first calculation:")
cat("Total User = ", timeUsed[1], "System CPU = ", timeUsed[2],"Elapsed = ", timeUsed[3])
