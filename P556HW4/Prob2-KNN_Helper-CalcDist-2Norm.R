allDist <- sort(rowSums(
    scale(tr_feat, center = as.numeric(dataPt), scale = F) ^ 2
))