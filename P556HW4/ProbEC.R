# ProbEC.R: Draw the ROC curve for the given data set 

pos_m1 <- c(0.73, 0.69, 0.44, 0.55, 0.67, 0.47, 0.08, 0.15, 0.45, 0.35)
pos_m2 <- c(0.61, 0.03, 0.68, 0.31, 0.45, 0.09, 0.38, 0.05, 0.01, 0.04)
trueClass <- c(1, 1, 0, 0, 1, 1, 0, 0, 1, 0)

posLab <- trueClass == 1
numPos <- sum(posLab)
negLab <- trueClass == 0
numNeg <- sum(negLab)

plot(0, 0,
     main = "ROC Curve",
     xlim = c(0, 1),
     ylim = c(0, 1),
     xlab = "False Positive Rate",
     ylab = "True Positive Rate")

 allLevels <- sort(c(pos_m1, pos_m2, 0, 1))
#allLevels <- 1 - c(1, 0.645, 0.53, 0.415, 0.345, 0.2, 0.07, 0.045, 0.035, 0.02, 0)
numLevels <- length(allLevels)
m1_pts <- data.frame(matrix(0, nrow = numLevels, ncol = 3))
m2_pts <- data.frame(matrix(0, nrow = numLevels, ncol = 3))
names(m1_pts) <- c("FP", "TP", "Level")
names(m2_pts) <- c("FP", "TP", "Level")

for (j in 1:numLevels) {
    level <- allLevels[j]
    
    lab_m1_curr <- as.numeric(pos_m1 >= level)
    lab_m2_curr <- as.numeric(pos_m2 >= level)
    
    truePos_m1 <- sum(lab_m1_curr == 1 & posLab) / numPos
    truePos_m2 <- sum(lab_m2_curr == 1 & posLab) / numPos
    
    falsePos_m1 <- sum(lab_m1_curr == 1 & negLab) / numNeg
    falsePos_m2 <- sum(lab_m2_curr == 1 & negLab) / numNeg
    
    m1_pts[j,] <- c(falsePos_m1, truePos_m1, level)
    m2_pts[j,] <- c(falsePos_m2, truePos_m2, level)
}

points(m1_pts[,1:2],
       col = "steelblue2",
       pch = 19)
lines(m1_pts[,1:2],
      col = "steelblue2",
      lty = 1,
      lwd = 2)
points(m2_pts[,1:2],
       col = "orange",
       pch = 19)
lines(m2_pts[,1:2],
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

# Validation using built-in methods
library(pROC)
# Note that the direction has to be set as "<"
plot(roc(response = trueClass, predictor = pos_m1, direction = "<"))
plot(roc(response = trueClass, predictor = pos_m2, direction = "<"))


cat(roc_res$thresholds, sep = ", ")
cbind(1 - roc_res$specificities, roc_res$sensitivities, roc_res$thresholds)


