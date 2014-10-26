Getting-Cleaning-Data-Course-Project
====================================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set, in this case, the UCI HAR Dataset. T

 Begin by setting working directory to "~/UCI HAR Dataset/" which can be downloaded from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
 The goal of run_analysis.R is to do the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

These conditions are met by the following steps:
1. Loading the activity labels in the file "activity_labels.txt".
2. Loading the features from the file "features.txt" and assigning the features as column names to the measures supplied in
the "X_test.txt" and "X_train.txt" files, which are then merged together.
3. Identifying the column names that include either mean or std variables, and then subsetting the measures table to only include these columns.
4. Loading the subject_id as well as subject_id to activity link tables. Then merging these tables with the subject labels so that descriptive activity names
are used in the activities data set.
5. Merging the subject information with the measures information to create one data set.
6. Using the dcast function from the Reshape2 package, to aggregate the data set to provide the mean of each variable for every activity and subject.
7. Using the met function from the Reshape2 package to create a tidy data set where a variable column has a corresponding value.

Citation: 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
