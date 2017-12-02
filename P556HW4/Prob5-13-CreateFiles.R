rm(list = ls())
library(MASS)
cat("\014")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Create cross validation files
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

numFold <- 5
set.seed(20)

data_set <- Boston
data_set$crim <- as.numeric(data_set$crim >= median(Boston$crim))

data_set_name <- "Boston"
data_set <- cbind(subset(data_set, select = -crim),
                  subset(data_set, select = crim))
# Create train and validation files
source("Prob1-CreateFiles.R")
