# Steps performed in cleaning up data.

used cbind() to merge subject_test, y_test, and x_test data

used cbind() to merge subject_train, y_train, and x_train data

used rbind() to merge the test and train data

renamed first column of merged data set to "subject"

renamed second column of merged data set to "activity"

renamed columns 3-563 using the list of varible names in "features.txt" file

created a subset of data by extracting any columns with 
"mean()" or "std()" in the name in addition to subject and activity columns

used "activity_labels.txt" file to replace activity numbers with descriptive labels
in the tidied data subset

cleaned up variable names by replacing "t" with "time", "f" with "frequency", 
removed "-" and "()" using the sub and gsub functions

created a tidy data set of mean values for each activity for each subject using 
group_by and summarize_each functions





