setwd("/Users/chuckjia/Desktop/P556HW3")
require("MASS")

# ===== ===== ===== ===== ===== ===== 
# Problem a
# ===== ===== ===== ===== ===== ===== 

rm(list = ls())
namesBoston <- names(Boston)

coefMat <- matrix(0, nrow = 2, ncol = 13)
pvalue <- matrix(0, nrow = 2, ncol = 13)
y <- Boston$medv
for (j in 1:13) {
    x <- data.matrix(Boston[j])
    lmfitThis <- lm(y ~ x)
    coefMat[,j] <- lmfitThis$coefficients
    pvalue[,j] <- summary(lmfitThis)$coefficients[,4]
}
colnames(coefMat) <- namesBoston[1:13]
rownames(coefMat) <- c("beta_0", "beta_1")
colnames(pvalue) <- namesBoston[1:13]
rownames(pvalue) <- c("beta_0", "beta_1")
# t(pvalue)

if (FALSE) {
    for (j in 1:13) {
        filename = paste("Prob2-Ex15-a-", j, ".pdf", sep = "")
        pdf(filename, width = 7, height = 6)
        plot(Boston[,j], y, col = "darkgreen", xlab = namesBoston[j], ylab = namesBoston[14]); abline(coefMat[,j], col = "orange")
        # This will redirect the output of the plot() function
        dev.off()
    }
}

simpLRCoef <- coefMat[2,]

# ===== ===== ===== ===== ===== ===== 
# Problem b
# ===== ===== ===== ===== ===== ===== 

lm.fit <- lm(medv ~ ., data = Boston)
multiLRCoef <- summary(lm.fit)$coefficients
multiLRCoef <- multiLRCoef[,1]
multiLRCoef <- multiLRCoef[2:length(multiLRCoef)]
# cat(array(s$coefficients[,1]), sep = "\\\\ ")

# ===== ===== ===== ===== ===== ===== 
# Problem c
# ===== ===== ===== ===== ===== =====

pointsPlot <- cbind(simpLRCoef, multiLRCoef)
plot(pointsPlot, col = "darkgreen",
     xlab = "Coef. from Simple Linear Regression",
     ylab = "Coef. from Multivariate Linear Regression")
pointsPlotNoNox <- rbind(pointsPlot[1:4,], pointsPlot[6:13,])
plot(pointsPlotNoNox, col = "darkgreen")

# ===== ===== ===== ===== ===== ===== 
# Problem d
# ===== ===== ===== ===== ===== =====

rm(list = ls())
namesBoston <- names(Boston)

coefMat <- matrix(0, nrow = 4, ncol = 13)
pvalue <- matrix(0, nrow = 4, ncol = 13)
Fpvalue <- array(0, dim = 13)
y <- Boston$medv
for (j in 1:13) {
    x <- data.matrix(Boston[j])
    lmfitThis <- lm(y ~ x + I(x^2) + I(x^3))
    # lmfitThis <- lm(y ~ poly(x, 3))
    coefMat[,j] <- lmfitThis$coefficients
    pvalue[,j] <- summary(lmfitThis)$coefficients[,4]
    s <- summary(lmfitThis)
    s <- array(s$fstatistic)
    Fpvalue[j] <- pf(q = s[1], df1 = s[2], df2 = s[3], lower.tail=F)
}
colnames(coefMat) <- namesBoston[1:13]
rownames(coefMat) <- c("beta_0", "beta_1", "beta_2", "beta_3")
colnames(pvalue) <- namesBoston[1:13]
rownames(pvalue) <- c("beta_0", "beta_1",  "beta_2", "beta_3")
names(Fpvalue) <- namesBoston[1:13]
t(coefMat)
t(pvalue)
matrix(Fpvalue, ncol = 1)


