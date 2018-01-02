# ===== ===== ===== ===== ===== ===== 
# Problem 3.1
# ===== ===== ===== ===== ===== ===== 

sigmod <- function(z) {
    return(1 / (1 + exp(-z)))
}

zVec <- array(-100:100) / 100 * 10
g <- sigmod(zVec)
# g <- 1 / (1 + exp(-zVec))
plot(zVec, g,
     type = "p", col = "darkgreen",
     main = "Sigmod Function",
     xlab = "z", ylab = "g(z)")

# ===== ===== ===== ===== ===== ===== 
# Problem 3.2
# ===== ===== ===== ===== ===== ===== 

source("Prob3-Q2.R")

# Testing: need to run Prob3-Q2.R first
new.Auto <- data.frame(new.Auto)
glm(mpg01 ~ cylinders + displacement + horsepower + weight, data = new.Auto, family = binomial)


# ===== ===== ===== ===== ===== ===== 
# Problem 3.3
# ===== ===== ===== ===== ===== =====

diff <- mpg01 - 1 * (1 / (1 + exp(-X %*% theta)) > 0.5)
errorRate <- sum(diff * diff) / length(diff)

# ===== ===== ===== ===== ===== ===== 
# Problem 3.4
# ===== ===== ===== ===== ===== =====

xNew <- c(8, 340, 200, 3500)
xNew <- (xNew - new.Auto.colMeans) / new.Auto.colSD
xNew <- c(1, xNew)
1 / (1 + exp(-sum(xNew * theta)))

# ===== ===== ===== ===== ===== ===== 
# Problem 3.5
# ===== ===== ===== ===== ===== =====

# See "Prob-3-5-Plots.R"









