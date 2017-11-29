# Prob1-Commands.R: Create k-fold validation files 
# This is the wrapper file for all the methods and scripts in problem 1

# Settings
set.seed(20)
numFold <- 5
data_set_name <- "ionosphere"
# data_set_name <- "car"
# data_set_name <- "crx"


# Read data set from file
filename <- paste("Data/", data_set_name, ".data", sep = "")
data_set <- read.table(filename, sep = ",", stringsAsFactors = F)
# Create train and validation files
source("Prob1-CreateFiles.R")
rm(filename)


