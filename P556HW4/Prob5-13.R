rm(list = ls())
library(MASS)
cat("\014")

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Logistic regression
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

data_set_name <- "Boston"
numFold <- 5
folderPath <- "Data/Boston_KFold/"
source("Prob1-ReadKFold.R")

err_logit <- array(0, dim = numFold)
for (foldNo in 1:numFold) {
    data_set <- cbind(tr_resp_list[[foldNo]], tr_feat_list[[foldNo]])
    source("Prob5-13-Logit_Helper.R")
    vld_pred <- predict(logit_res, vld_feat_list[[foldNo]], type = "response")
    err_logit[foldNo] <- sum((vld_pred >= 0.5) 
                                 != vld_resp_list[[foldNo]]) / nrow(vld_resp_list[[foldNo]])
}
cat("c("); cat(err_logit, sep = ", "); cat(")")

# Logit error results
# All predictors: c(0.1089109, 0.1485149, 0.1089109, 0.1386139, 0.06862745)
# Subset 1: c(0.1980198, 0.2079208, 0.1188119, 0.1881188, 0.04901961)
# Subset 2: c(0.1386139, 0.1782178, 0.1881188, 0.2079208, 0.1666667)
# Subset 3: c(0.1683168, 0.2079208, 0.1980198, 0.2079208, 0.1666667)
# Subset 4: c(0.2277228, 0.3069307, 0.2277228, 0.2673267, 0.1568627)
# Subset 5: c(0.3267327, 0.4356436, 0.2475248, 0.3168317, 0.3431373)

# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# KNN
# ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

err_logit <- array(0, dim = numFold)
for (foldNo in 1:numFold) {
    source("Prob5-13-KNN_Helper.R")
    err_logit[foldNo] <- sum(as.numeric(as.character(vld_pred)) != vld_resp_list[[foldNo]]) / nrow(vld_resp_list[[foldNo]])
}
cat("c("); cat(err_logit, sep = ", "); cat(")")

# KNN error results
# All predictors: c(0.05940594, 0.06930693, 0.07920792, 0.08910891, 0.05882353)
# Subset 1: c(0.1386139, 0.1287129, 0.1683168, 0.1584158, 0.1568627)
# Subset 2: c(0.03960396, 0.1287129, 0.1188119, 0.07920792, 0.04901961)
# Subset 3: c(0.05940594, 0.05940594, 0.1089109, 0.06930693, 0.04901961)
# Subset 4: c(0.01980198, 0.04950495, 0.07920792, 0.07920792, 0)
# Subset 5: c(0.05940594, 0.1089109, 0.07920792, 0.1386139, 0.03921569)








