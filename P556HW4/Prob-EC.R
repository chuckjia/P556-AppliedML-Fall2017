pos_m1 <- c(0.73, 0.69, 0.44, 0.55, 0.67, 0.47, 0.08, 0.15, 0.45, 0.35)
pos_m2 <- c(0.61, 0.03, 0.68, 0.31, 0.45, 0.09, 0.38, 0.05, 0.01, 0.04)
trueClass <- c(1, 1, 0, 0, 1, 1, 0, 0, 1, 0)

plot(0, 0,
     main = "ROC Curve",
     xlim = c(0, 1),
     ylim = c(0, 1),
     xlab = "False Positive Rate",
     ylab = "True Positive Rate")

allLevels <- sort(c(pos_m1, pos_m2, 0, 1))
numLevels <- length(allLevels)
m1_pts <- matrix(0, nrow = numLevels, ncol = 2)
m2_pts <- matrix(0, nrow = numLevels, ncol = 2)

for (j in 1:numLevels) {
    level <- allLevels[j]
    
    lab_m1_curr <- as.numeric(pos_m1 > level)
    lab_m2_curr <- as.numeric(pos_m2 > level)
    
    posLab <- true_curr == 1
    numPos <- sum(posLab)
    truePos_m1 <- sum(lab_m1_curr == 1 & posLab) / numPos
    truePos_m2 <- sum(lab_m2_curr == 1 & posLab) / numPos
    
    negLab <- true_curr == 0
    numNeg <- sum(negLab)
    falsePos_m1 <- sum(lab_m1_curr == 1 & negLab) / numNeg
    falsePos_m2 <- sum(lab_m2_curr == 1 & negLab) / numNeg
    
    m1_pts[j,] <- c(falsePos_m1, truePos_m1)
    m2_pts[j,] <- c(falsePos_m2, truePos_m2)
}

points(m1_pts,
       col = "steelblue2",
       pch = 19)
lines(m1_pts,
      col = "steelblue2",
      lty = 1,
      lwd = 2)
points(m2_pts,
       col = "orange",
       pch = 19)
lines(m2_pts,
      col = "orange",
      lty = 1,
      lwd = 2)
lines(cbind(c(-0.5,1.5), c(-0.5,1.5)),
      lty = 2,
      col = "gray")

legend(0.8, 0.2,
       c("M1", "M2"),
       lty = c(1, 1),
       lwd = c(2, 2),
       col = c("steelblue2", "orange"))

