setwd("/Users/chuckjia/Desktop/P556HW3")
require("ISLR")

# ===== ===== ===== ===== ===== ===== 
# Problem 1.6
# ===== ===== ===== ===== ===== ===== 

source("Prob1-Q6.R")

# ===== ===== ===== ===== ===== ===== 
# Problem 1.7
# ===== ===== ===== ===== ===== ===== 

xVec <- c(4, 300, 200, 3500, 11, 70, 2)
xMeans <- obsColMeans[2:length(obsColMeans)]
mpgMean <- obsColMeans[1]
xSD <- obsColSD[2:length(obsColSD)]
mpgSD <- obsColSD[1]
xVec <- (xVec - xMeans) / xSD;
mpgPred <- sum(c(1, xVec) * theta)
mpgPred <- mpgPred * mpgSD + mpgMean

# ===== ===== ===== ===== ===== ===== 
# Problem 1.8
# ===== ===== ===== ===== ===== ===== 

# Use Prob1-Q8-Plot.R

# ===== ===== ===== ===== ===== ===== 
# Problem 1.9
# ===== ===== ===== ===== ===== =====  

rm(list = ls())
obs <- subset(Auto, select = -name)
# Feature scaling
obsColMeans <- colMeans(obs)
numColObs <- ncol(obs)
obsColSD <- array(0, dim = numColObs)
for (j in 1:numColObs)
    obsColSD[j] = sd(obs[,j])
obs <- scale(obs, center = TRUE, scale = TRUE)
X <- data.matrix(subset(obs, select = -mpg))
X <- cbind(1, X); colnames(X)[1] <- "Intercept"
y <- data.matrix(subset(obs, select = mpg))

thetaClosedForm = solve(t(X) %*% X) %*% t(X) %*% y
# Or alternatively and less computationally demanding way is the following
# They will give the same result
# thetaClosedForm = solve(t(X) %*% X, t(X) %*% y)

# ===== ===== ===== ===== ===== ===== 
# Testing
# ===== ===== ===== ===== ===== ===== 

rm(list = ls())
obs <- subset(Auto, select = -name)
colnames(obs)
lrRes <- lm(mpg ~ cylinders + displacement + horsepower + weight + acceleration + year + origin, data = obs)
thetaRBuiltin = lrRes$coefficients
xVec <- c(1, 4, 300, 200, 3500, 11, 70, 2)
mpgPred <- sum(xVec * thetaRBuiltin)

# Print theta in Latex compatible form
#cat(array(theta), sep = " \\\\ ")
