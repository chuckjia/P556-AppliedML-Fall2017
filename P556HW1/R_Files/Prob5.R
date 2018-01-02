# ===== ===== ===== ===== ===== ===== 
# Using k-means built-in functions
# ===== ===== ===== ===== ===== ===== 

k <- 2  # Number of clusters
n <- nrow(obs)  # Number of observations
d <- ncol(obs)  # Number of dimensions

# Run k-means with built-in functions
kmRes = kmeans(obs, k, iter.max = 100, nstart = 1, algorithm = "Lloyd", trace=FALSE)
# The result of cluster in the form of labels on each data points
label = kmRes$cluster

# Count labels in each cluster
label1Count = matrix(0, nrow = 1, ncol = k)
label2Count = matrix(0, nrow = 1, ncol = k)
for (i in 1:n) {
    classOrig <- classRes[i]
    labelCurr <- label[i]
    if (classOrig == label1) 
        label1Count[labelCurr] = label1Count[labelCurr] + 1
    else 
        label2Count[labelCurr] = label2Count[labelCurr] + 1
}

# Calculate error rates
errorRates = matrix(0, nrow = 1, ncol = k)  # Vector storing error rates in each cluster
for (i in 1:k) {
    label1CountCurr = label1Count[i]
    label2CountCurr = label2Count[i]
    if (label1CountCurr >= label2CountCurr) 
        errorRates[i] = label2CountCurr / (label2CountCurr + label1CountCurr)
    else 
        errorRates[i] = label1CountCurr / (label2CountCurr + label1CountCurr)
}
totalError = sum(errorRates)
print(totalError)

# ===== ===== ===== ===== ===== ===== 
# Using Elbow Method
# ===== ===== ===== ===== ===== ===== 

elbPoints = sapply(2:10, function(k){kmeans(obs, k, nstart = 20, iter.max = 100)$tot.withinss})

plot(elbPoints, main = "Elbow Method", xlab = "Number of clusters (k)", ylab = "Total within-cluster sum of squares" ,col = "darkgreen", bg = "darkgreen", pch = 21, type = "b")




