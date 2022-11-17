# Merges the training and the test sets to create one data set.
library(dplyr)
library(readr)

x_test <- read.table("./data/test/X_test.txt", header = FALSE)
subject_test <- read.table("./data/test/subject_test.txt", header = FALSE)
y_test <- read.table("./data/test/y_test.txt", header = FALSE)

merged_test <- cbind(subject_test, y_test, x_test)

x_train <- read.table("./data/train/X_train.txt", header = FALSE)
subject_train <- read.table("./data/train/subject_train.txt", header = FALSE)
y_train <- read.table("./data/train/y_train.txt", header = FALSE)

merged_train <- cbind(subject_train, y_train, x_train)

merged <- rbind(merged_test, merged_train)

# set up column names using data in the features.txt file
features <- read.table("./data/features.txt")
colnames(merged)[1] <- "subject"
colnames(merged)[2] <- "activity"
colnames(merged)[3:563] <- features[, 2]

# Extracts only the measurements on the mean and standard deviation
# for each measurement. 
# also extract subject and activity columns
subset <- select(merged, 1:2, grep("mean()|std()", colnames(merged)))

# Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./data/activity_labels.txt")
activity_labels <- activity_labels[, 2]
subset$activity <- activity_labels[subset$activity]

# Appropriately labels the data set with descriptive variable names.
colnames(subset)[3:81] <- sub("^t", "time", colnames(subset)[3:81])
colnames(subset)[3:81] <- sub("^f", "frequency", colnames(subset)[3:81])
colnames(subset)[3:81] <- gsub("-", "", colnames(subset)[3:81])
colnames(subset)[3:81] <- sub("\\()", "", colnames(subset)[3:81])
colnames(subset)[3:81] <- tolower(colnames(subset)[3:81])

# From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.
tidyset <- subset %>%
    group_by(subject, activity) %>%
    summarize_each(mean)

