# ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Parameters
# ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# These parameters might be set outside of this file
# tol = 0  # Tolerance used in stopping condition
# maxItr = 2e6  # Maximum number of iterations
# alpha = 3e-7  # Learning rate
# msgFreq = 1e5  # Frequency of messages

# ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Processing data
# ===== ===== ===== ===== ===== ===== ===== ===== ===== 

m <- nrow(X)  # Number of data points
n <- ncol(X)  # Number of features
Xt = t(X)  # Save the transpose for later use
# Initialization of theta
theta = matrix(0, nrow = n, ncol = 1)

# ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Gradient descent 
# ===== ===== ===== ===== ===== ===== ===== ===== ===== 

JValVec <- c(sum(y * y) / (2 * m))
prevJVal = 0; JVal = prevJVal + tol + 1;
itrNo = 1
cat("Running gradient descent on linear models\n")
while (abs(JVal - prevJVal) > tol && itrNo < maxItr) {
    # Print message
    if (itrNo %% msgFreq == 0) {
        cat("\r - Current iteration: ", itrNo, ", theta = ( ", sep = "")
        cat(theta, sep = ", "); cat(" )                    ", sep = "")
    }
    # Store previous cost value
    prevJVal <- JVal
    # Gradient descent
    theta <- theta - Xt %*% (X %*% theta - y) * alpha
    # Check convergence condition
    JVal <- X %*% theta - y
    JVal <- sum(JVal * JVal) / (2 * m)
    JValVec <- c(JValVec, JVal)
    itrNo <- itrNo + 1
}
# Print result
cat("\r - Completed in ", itrNo, " iterations.", sep = "")
cat("                                                            ", sep = "")
cat("                                                          \n", sep = "")
cat("\r - theta = ( ", sep = ""); cat(theta, sep = ", "); cat(" )\n", sep = "")


