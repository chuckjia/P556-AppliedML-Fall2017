# All features
# feat_set <- c("zn", "indus", "chas", "nox", "rm", "age", "dis",
#               "rad", "tax", "ptratio", "black", "lstat", "medv")

# Subset 1
 # feat_set <- c("zn", "indus", "chas", "nox", "rm", "age", "dis")

# Subset 2
# feat_set <- c("rad", "tax", "ptratio", "black", "lstat", "medv")

# Subset 3
# feat_set <- c("zn", "chas", "rm", "dis", "tax", "black", "medv")

# Subset 4
# feat_set <- c("tax")

# Subset 5
# feat_set <- c("ptratio")

train_feat <- subset(tr_feat_list[[foldNo]], select = feat_set)
vld_feat <- subset(vld_feat_list[[foldNo]], select = feat_set)
vld_pred <- knn(train = train_feat, test = vld_feat, cl = tr_resp_list[[foldNo]][,1])