run_analysis <- function() {
  #loads the activity labels
  activity_labels <- read.table("activity_labels.txt", col.names = c("activity_id","activity_name"))
  
  #loads features, assigns feature names, and merges the test and training sets
  features <- read.table("features.txt")[,2] 
  x_test <- read.table("./test/X_test.txt")
  names(x_test) <- features
  x_train <- read.table("./train/X_train.txt")
  names(x_train) <- features
  measr <- rbind(x_test,x_train)
  
  #Extracts only the measurements on the mean and standard deviation for each measurement.
  extract_mean <- grep(".*mean\\(\\).*", features)
  extract_std <- grep(".*std\\(\\).*", features)
  extract_measr <- measr[,c(extract_mean,extract_std)]
  
  #loads the test labels and subject ids
  y_test <- read.table("./test/y_test.txt", col.names = c("activity_id"))
  subject_test <- read.table("./test/subject_test.txt", col.names = c("subject_id"))
  subject_y_test <- cbind(subject_test,y_test)
  
  #loads the training labels and subject ids
  y_train <- read.table("./train/y_train.txt", col.names = c("activity_id"))
  subject_train <- read.table("./train/subject_train.txt", col.names = c("subject_id"))
  subject_y_train <- cbind(subject_train,y_train)
  
  #Uses descriptive activity names to name the activities in the data set
  subjects <- rbind(subject_y_test,subject_y_train)
  subject_labels <- merge(subjects, activity_labels)
  
  #Merges the training and the test sets to create one data set.
  merged_data <- cbind(subject_labels[,2:3],extract_measr)
  
  #creates a second, independent tidy data set with the average of each variable for each activity and each subject
  melted <- melt(merged_data, id.vars = c("subject_id", "activity_name"))
  casted <- dcast(melted, subject_id + activity_name ~ variable, fun.aggregate = mean)
  tidy_data <- melt(casted, id.vars = c("subject_id", "activity_name"))
  
  #writes table
  write.table(tidy_data, "tidy_data.txt", row.names=FALSE)
}
