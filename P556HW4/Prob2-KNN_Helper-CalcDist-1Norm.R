allDist <- sort(rowSums(abs(
    scale(tr_feat, center = as.numeric(dataPt), scale = F)
)))