# All features
# feat_set <- c("zn", "indus", "chas", "nox", "rm", "age", "dis", 
#               "rad", "tax", "ptratio", "black", "lstat", "medv", "crim")

# Subset 1
# feat_set <- c("zn", "indus", "chas", "nox", "rm", "age", "dis", "crim")

# Subset 2
# feat_set <- c("rad", "tax", "ptratio", "black", "lstat", "medv", "crim")

# Subset 3
# feat_set <- c("zn", "chas", "rm", "dis", "tax", "black", "medv", "crim")

# Subset 4
# feat_set <- c("tax", "crim")

# Subset 5
# feat_set <- c("ptratio", "crim")

logit_res <- glm(crim ~ ., data = subset(data_set, select = feat_set), 
                 family = binomial(link = "logit"))







