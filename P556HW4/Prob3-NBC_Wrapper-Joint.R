if (data_set_name == "ionosphere") {
    CalcLikelihd_NBC_Helper_FILE <- "Prob3-NBC_Helper-Joint-CalcLikelihd-Iono.R"
} else
    CalcLikelihd_NBC_Helper_FILE <- "Prob3-NBC_Helper-Joint-CalcLikelihd-CarCrx.R"
folderPath <- "Data/KFold_NBC/"
source("Prob1-ReadKFold.R")

source("Prob3-NBC-Joint.R")

rm(CalcLikelihd_NBC_Helper_FILE)