# ===== ===== ===== ===== ===== ===== 
# Problem 1.1
# ===== ===== ===== ===== ===== =====

rm(list = ls())
X <- cbind(1, Auto$horsepower)
y <- Auto$mpg
# Set parameters
tol = 1e-22  # Tolerance used in stopping condition
maxItr = 1e7  # Maximum number of iterations
alpha = 4.1e-7  # Learning rate
msgFreq = 1e5
source("Prob1-gradDescent.R")

# write.csv(obs, "DataFiles/Prob1-Obs.csv", row.names = FALSE)