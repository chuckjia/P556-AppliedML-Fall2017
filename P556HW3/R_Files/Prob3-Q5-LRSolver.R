# ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Problem 3.5: Solving the linear regression problem
# ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# rm(list = ls())
# Transform mpg into binary data
mpgMedian <- median(Auto$mpg)
mpg01 <- 1 * (Auto$mpg >= mpgMedian)

new.Auto <- data.matrix(subset(Auto, select = c(cylinders, displacement, horsepower, weight)))
# Calculate the scales
new.Auto.colMeans <- colMeans(new.Auto)
numCol.new.auto = ncol(new.Auto)
new.Auto.colSD <- array(0, dim = numCol.new.auto)
names(new.Auto.colSD) <- names(new.Auto.colMeans)
for (j in 1:numCol.new.auto) 
    new.Auto.colSD[j] <- sd(new.Auto[,j])
# Scaling the new.Auto data
new.Auto <- scale(new.Auto, center = TRUE, scale = TRUE)
new.Auto <- cbind(mpg01, new.Auto)

X <- new.Auto[,2:ncol(new.Auto)]
X <- cbind(1, X)
colnames(X)[1] <- "Intercept"
y <- new.Auto[,1]

tol = 0  # Tolerance used in stopping condition
maxItr = 5000  # Maximum number of iterations
#alpha = 1e-3  # Learning rate
msgFreq = 1e2  # Frequency of messages

source("Prob3-gradDescent-stoppingJ.R")
