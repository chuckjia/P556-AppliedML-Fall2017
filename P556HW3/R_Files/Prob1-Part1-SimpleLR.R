setwd("/Users/chuckjia/Desktop/P556HW3")
require("ISLR")

# ===== ===== ===== ===== ===== ===== 
# Problem 1.1
# ===== ===== ===== ===== ===== ===== 

source("Prob1-Q1.R")

# ===== ===== ===== ===== ===== ===== 
# Problem 1.2
# ===== ===== ===== ===== ===== ===== 

plot(Auto$horsepower, Auto$mpg, col = "orange", main = "mpg ~ horsepower")
# theta = c(39.93586, -0.1578447) from the gradient descent solver
abline(coef = theta, col = "darkgreen", lwd = 2)

# ===== ===== ===== ===== ===== ===== 
# Problem 1.3
# ===== ===== ===== ===== ===== ===== 

x1 = 220
theta[1] + x1 * theta[2]

# ===== ===== ===== ===== ===== ===== 
# Problem 1.4
# ===== ===== ===== ===== ===== ===== 

# Use Prob1ContourPlot.m

# ===== ===== ===== ===== ===== ===== 
# Problem 1.5
# ===== ===== ===== ===== ===== ===== 

rm(list = ls())
obs <- cbind(1, Auto$horsepower, Auto$mpg)
dataDim = dim(obs)
m <- dataDim[1]  # Number of data points
n <- dataDim[2] - 1  # Number of features
X <- obs[, 1:n]
y <- obs[, n + 1]
thetaClosedForm = solve(t(X) %*% X) %*% t(X) %*% y
# Or alternatively and less computationally demanding way is the following
# They will give the same result
# thetaClosedForm = solve(t(X) %*% X, t(X) %*% y)

# ===== ===== ===== ===== ===== ===== 
# Testing
# ===== ===== ===== ===== ===== ===== 

thetaTrue <- lm(Auto$mpg ~ Auto$horsepower)
thetaTrue = thetaTrue$coefficients
sum((X %*% theta - y) ^ 2)
sum((X %*% thetaTrue - y) ^ 2)
thetaMATLAB <- matrix(c(33.4, -0.125), ncol = 1)
sum(t(X %*% thetaMATLAB - y) ^ 2)
