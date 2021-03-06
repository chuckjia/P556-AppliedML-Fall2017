# ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Problem 3.5: Plotting
# ===== ===== ===== ===== ===== ===== ===== ===== ===== 

rm(list = ls())
alpha = 0.00003  # Learning rate
source("Prob3-Q5-LRSolver.R")

# alpha = 3, 0.3, 0.03
plot(JValVec[is.finite(JValVec)], 
     type = "p", col = "darkgreen", bg = "darkgreen", pch = 21,
     main = paste("Cost Function Value During Gradient Descent\nalpha = ", alpha, sep = ""),
     xlab = "Iteration Number", ylab = expression("Cost Function"~J(theta)))

plot(log(JValVec[is.finite(JValVec)]), 
     type = "p", col = "darkgreen", bg = "darkgreen", pch = 21, 
     main = paste("Cost Function Log Value During Gradient Descent\nalpha = ", alpha, sep = ""),
     xlab = "Iteration Number", ylab = ~log~J(theta))

# alpha = 0.00003
plot(JValVec[2:length(JValVec)], 
     type = "p", col = "darkgreen", bg = "darkgreen", pch = 21,
     main = paste("Cost Function Value During Gradient Descent\nalpha = ", alpha, sep = ""),
     xlab = "Iteration Number", ylab = expression("Cost Function"~J(theta)))



