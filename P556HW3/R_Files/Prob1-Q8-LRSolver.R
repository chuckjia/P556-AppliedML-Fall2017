# ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Problem 1.8: Solving the linear regression problem
# ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# rm(list = ls())
obs <- subset(Auto, select = -name)
# Feature scaling
obsColMeans <- colMeans(obs)
numColObs <- ncol(obs)
obsColSD <- array(0, dim = numColObs)
for (j in 1:numColObs)
    obsColSD[j] = sd(obs[,j])
obs <- scale(obs, center = TRUE, scale = TRUE)

# Alternative way of normalizing matrix
# obsp <- obs
# for (j in 1:numColObs) 
#     obsp[, j] <- (obsp[, j] - obsColMeans[j]) / obsColSD[j]
# print(obs - obsp)

X <- data.matrix(subset(obs, select = -mpg))
X <- cbind(1, X); colnames(X)[1] <- "Intercept"
y <- data.matrix(subset(obs, select = mpg))

# Set parameters
tol = 1e-17  # Tolerance used in stopping condition
maxItr = 100  # Maximum number of iterations

# alpha = 0.03  # Learning rate
msgFreq = 1e3
source("Prob1-gradDescent-stoppingJ.R")
cat("( "); cat(colnames(X), sep = ", "); cat(" )")





