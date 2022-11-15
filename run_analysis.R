# Merges the training and the test sets to create one data set.
library(readr)
x_test <- read.csv("./data/test/X_test.txt", header = FALSE, sep = " ")
x_train <- read.csv("./data/train/X_train.txt", header = FALSE, sep = " ")


# Extracts only the measurements on the mean and standard deviation
# for each measurement. 

# Uses descriptive activity names to name the activities in the data set

# Appropriately labels the data set with descriptive variable names. 

# From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.