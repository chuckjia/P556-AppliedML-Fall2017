# ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Problem 2: Exercise 13 
# ===== ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
set.seed(1)

# ----- ----- ----- ----- ----- ----- 
# Part a-c
# ----- ----- ----- ----- ----- ----- 

x <- rnorm(100, mean = 0, sd = 1)

varEps = 0.7^2
eps <- rnorm(100, mean = 0, sd = sqrt(varEps))

y <- -1 + 0.5 * x + eps
cat("The length of Y is ", length(y), "\n", sep = "")
cat("beta_0 = -1, beta_1 =0.5 ")

# ----- ----- ----- ----- ----- ----- 
# Part d
# ----- ----- ----- ----- ----- ----- 

plot(x, y,  
     type = "p", col = "darkgreen",
     main = "Scatter Plot of X and Y",
     xlab = "X", ylab = "Y")

# ----- ----- ----- ----- ----- ----- 
# Part e
# ----- ----- ----- ----- ----- ----- 

lm.fit <- lm(y ~ x)
print(confint(lm.fit))
theta <- lm.fit$coefficients
# Result: Original data set
# (Intercept)           x 
#  -1.0188463   0.4994698

# Alternatively using the gradient descent
X <- cbind(1, x)
# Set parameters
tol <- 1e-17  # Tolerance used in stopping condition
maxItr <- 1e7  # Maximum number of iterations
alpha <- 3e-5  # Learning rate
msgFreq <- 1e3
source("Prob1-gradDescent.R")


# ----- ----- ----- ----- ----- ----- 
# Part f
# ----- ----- ----- ----- ----- ----- 

plot(x, y,  
     type = "p", col = "darkgreen",
     main = "Linear Regression Y ~ X",
     xlab = "X", ylab = "Y")
abline(theta, col = "orange", lwd = 1)
thetaPopu <- c(-1, 0.5)
abline(thetaPopu, col = "red", lwd = 1, lty = 2)
legend(-2.2, 0.3, legend=c("Least square line", "Population regression line  "),
       col=c("orange", "red"), lty=1:2, cex=0.8)

# ----- ----- ----- ----- ----- ----- 
# Part g
# ----- ----- ----- ----- ----- ----- 

# theta <- lm(y ~ poly(x, 2))
theta <- matrix(lm(y ~ x + I(x^2))$coefficients, ncol = 1)
yHat <- cbind(1, x, x^2) %*% theta
# Residual Sum Squares
RSS_quad <- sum((yHat - y)^2)

theta <- matrix(lm(y ~ x)$coefficients, ncol = 1)
yHat <- cbind(1, x) %*% theta 
RSS_linear <- sum((yHat - y)^2)
    
    
    
    