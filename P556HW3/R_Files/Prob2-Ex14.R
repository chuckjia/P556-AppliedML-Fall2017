# ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Problem 2: Exercise 14 
# ===== ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())

# ----- ----- ----- ----- ----- ----- 
# Part a-b
# ----- ----- ----- ----- ----- ----- 

set.seed(1)
x1 <- runif(100)
x2 <- 0.5 * x1 + rnorm(100) / 10
y <- 2 + 2 * x1 + 0.3 * x2 + rnorm(100)

x1 <- c(x1, 0.1)
x2 <- c(x2, 0.8)
y <- c(y, 6)

cor(x1, x2)

plot(x1, x2,  
     type = "p", col = "darkgreen",
     main = "Scatter Plot of x1 and x2")
points(0.1, 0.8,
       type = "p", col = "orange", pch = 21)


# ----- ----- ----- ----- ----- ----- 
# Part c
# ----- ----- ----- ----- ----- ----- 

lm.fit <- lm(y ~ x1 + x2)
lm.fit$coefficients - c(2, 2, 0.3)
summary(lm.fit)

# ----- ----- ----- ----- ----- ----- 
# Part d
# ----- ----- ----- ----- ----- ----- 

lm.fit <- lm(y ~ x1)
lm.fit$coefficients - c(2,2)
summary(lm.fit)


# ----- ----- ----- ----- ----- ----- 
# Part e
# ----- ----- ----- ----- ----- ----- 

lm.fit <- lm(y ~ x2)
lm.fit$coefficients - c(2, 0.3)
summary(lm.fit)

