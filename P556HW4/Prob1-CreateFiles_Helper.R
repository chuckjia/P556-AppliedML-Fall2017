# Prob1-CreateFiles_Helper.R: Helper for creating k-fold cross validation files
# Input:: data_set, valid_ind, all_index, data_set_name, foldNo
# Output:: The output files are in the Temp folder

# Generate validation and training data sets
vld_data <- data_set[valid_ind,]
tr_data <- data_set[setdiff(all_index, valid_ind),]

# Write validation data to file
filename <- paste("Temp/", data_set_name, "_valid_", foldNo, ".csv", sep = "")
write.csv(vld_data, file = filename)
# Write training data to file
filename <- paste("Temp/", data_set_name, "_train_", foldNo, ".csv", sep = "")
write.csv(tr_data, file = filename)

rm(tr_data, vld_data)
