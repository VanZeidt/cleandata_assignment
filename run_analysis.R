# Check for missing packages and install them if necessary
list_of_packages <- c("ggplot2", "dplyr")
new_packages <- list_of_packages[!(list_of_packages %in%     
                                     installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)
rm(list_of_packages, new_packages)

# Load needed packages
library(dplyr)

download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', 
              destfile = 'samsung_dataset.zip', mode="wb")
unzip(zipfile = 'samsung_dataset.zip')
unlink('samsung_dataset.zip')

datasets_vec <- paste(rep(c('X', 'y', 'subject'), 2), rep(c('train', 'test'), each=3), sep='_')
file_list <- list.files(recursive = TRUE)

# This function finds and reads the file named <data_name>.txt and stores it in a variable called <data_name> in the global environment.
read_data <- function(data_name) {
  file_name <- grep(pattern = paste0('/', data_name, '.txt'), x = file_list, fixed = TRUE, value = TRUE)
  cat('Reading ', file_name, '\n')
  # Load the data to a variable with the name in 'data_name' argument to the global environment
  temp_data <- read.csv(file = file_name, header = FALSE, sep = '', stringsAsFactors = FALSE)
  assign(data_name, temp_data, envir = .GlobalEnv)
  # Verify that all columns are numeric
  if (all(apply(temp_data, 2, class) %in% c("numeric", "integer"))) {
    cat('All data are numeric.\n')
  } else {
    cat('Some data are NOT numeric.\n')
  }
}

tmp <- sapply(datasets_vec, read_data); rm(tmp) # Read in all datasets

file_name <- grep(pattern = '/features.txt', x = file_list, fixed = TRUE, value = TRUE)
features <- read.csv(file = file_name, header = FALSE, sep = ' ', stringsAsFactors = FALSE, col.names = c('id', 'colname'))

# Merge training and testing datasets
train <- cbind(X_train, subject_train, y_train)
train$dataset <- "train"
test <- cbind(X_test, subject_test, y_test)
test$dataset <- "test"

samsung_sensors_df <- rbind(test, train)

# Extract only the measurements on the mean and standard deviation for each measurement
needed_cols <- grep(pattern = '-mean\\(|-std\\(', x = features$colname, value = FALSE)
n_cols <- ncol(samsung_sensors_df)
samsung_sensors_df <- samsung_sensors_df[, c(needed_cols, # only the mean and stdev columns are needed 
                                             n_cols-2,    # subject column
                                             n_cols-1,    # activity column
                                             n_cols)]     # dataset column (train/test)

# Appropriately label the data set with descriptive variable names
col_names <- tolower(features$colname[needed_cols])
col_names <- gsub("^t", "time_", col_names)
col_names <- gsub("^f", "freq_", col_names)
col_names <- gsub("body", "body_", col_names)
col_names <- gsub("gravity", "gravity_", col_names)
col_names <- gsub("acc", "accelerometer_", col_names)
col_names <- gsub("gyro", "gyroscope_", col_names)
col_names <- gsub("jerk", "jerk_", col_names)
col_names <- gsub("-mean\\(\\)-?", "mean_", col_names)
col_names <- gsub("-std\\(\\)-?", "stdev_", col_names)
col_names <- gsub("mag", "mag_", col_names)
col_names <- gsub("_$", "", col_names)
col_names <- gsub("body_body_", "body_", col_names)

names(samsung_sensors_df) <- c(col_names, "subject", "activity", "dataset") # assign names

# Use descriptive activity names to name the activities in the data set
read_data("activity_labels")
names(activity_labels) <- c("label", "activity")

samsung_sensors_df$activity <- sapply(samsung_sensors_df$activity, function(idx) activity_labels$activity[idx])
table(samsung_sensors_df$activity, samsung_sensors_df$subject)  

# Create a data set with the average of each variable for each activity and each subject using dplyr package
samsung_sensor_means_df <- samsung_sensors_df %>%
  select(-dataset) %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Remove intermediary variables from workspace
rm(list = setdiff(ls(), c("samsung_sensor_means_df", "samsung_sensors_df")))

# List names
cat(names(samsung_sensors_df), sep='\n')

# List of activities
cat(sort(unique(samsung_sensors_df$activity)), sep='\n')
