rm(list = ls())

library(ISLR)

tr_feat <- subset(Weekly, select = Lag2)
vld_feat <- data.frame(matrix(tr_feat[Weekly$Year >= 2009,], ncol = 1))
tr_feat <-  data.frame(matrix(tr_feat[Weekly$Year <= 2008,], ncol = 1))

tr_resp <- subset(Weekly, select = Direction)
vld_resp <- data.frame(matrix(tr_resp[Weekly$Year >= 2009,], ncol = 1))
tr_resp <- tr_resp[Weekly$Year <= 2008,]

vld_pred <- knn(train = tr_feat, test = vld_feat, cl = tr_resp, k = 1)

TP <- vld_pred == "Up" & vld_resp == "Up"
numTP <- sum(TP)
FP <- vld_pred == "Up" & vld_resp == "Down"
numFP <- sum(FP)
TN <- vld_pred == "Down" & vld_resp == "Down"
numTN <- sum(TN)
FN <- vld_pred == "Down" & vld_resp == "Up"
numFN <- sum(FN)

# Method from textbook p. 160
true_resp <- vld_resp[,1]
table(vld_pred, true_resp)
mean(vld_pred == true_resp)
53/104
