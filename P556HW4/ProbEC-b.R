rm(list = ls())
t <- 0.5
pos_m1 <- c(0.73, 0.69, 0.44, 0.55, 0.67, 0.47, 0.08, 0.15, 0.45, 0.35)
pos_m2 <- c(0.61, 0.03, 0.68, 0.31, 0.45, 0.09, 0.38, 0.05, 0.01, 0.04)
trueClass <- c(1, 1, 0, 0, 1, 1, 0, 0, 1, 0)

pos <- pos_m1

TP <- pos > t & trueClass == 1; numTP <- sum(TP)
FP <- pos > t & trueClass == 0; numFP <- sum(FP)
TN <- pos < t & trueClass == 0; numTN <- sum(TN)
FN <- pos < t & trueClass == 1; numFN <- sum(FN)

precision <- numTP / (numTP + numFP)
recall <- numTP / (numFN + numTP)
Fmeasure <- 2 * precision * recall / (precision + recall)