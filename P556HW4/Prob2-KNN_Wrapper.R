# Prob2-KNN_Wrapper.R: Wrapper file for calling the KNN algorithm

errAll_KNN <- data.frame(matrix(0, nrow = length(neighborRange), ncol = numFold))
row.names(errAll_KNN) <- neighborRange
for (numNeighbor in neighborRange) {
     source("Prob2-KNN-MajorVoting.R")
    # source("Prob2-KNN-DistWeightVoting.R")
    # source("Prob2-R_KNN.R")
    errAll_KNN[which(neighborRange == numNeighbor),] <- err_vec
}

rm(numNeighbor, err_vec)
