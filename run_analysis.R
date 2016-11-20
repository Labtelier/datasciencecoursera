##1. Merges the training and the test sets to create one data set.
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
##3. Uses descriptive activity names to name the activities in the data set
##4. Appropriately labels the data set with descriptive variable names.
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


if (!require("plyr")) {
  install.packages("plyr")
}


if (!require("dplyr")) {
  install.packages("dplyr")
}


if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
  
}


require("data.table")
require("reshape2")
require("plyr")
require("dplyr")

## Read activity and features labels
activity_labels <- read.table("activity_labels.txt")
features <- read.table('features.txt')


##clean features because special charactere produce issues due to ()
cleanFeatures  <- gsub("[()]", "", features[,2])

##Read test data
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
body_acc_x_test <- read.table("test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test <- read.table("test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test <- read.table("test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("test/Inertial Signals/total_acc_z_test.txt")


##Read train data
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
body_acc_x_train <- read.table("train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train <- read.table("train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train <- read.table("train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("train/Inertial Signals/total_acc_z_train.txt")


##Apply features labels to x_train and x_test columns name
names(X_test) <- cleanFeatures
names(X_train) <- cleanFeatures


##Retrieve Mean and StDev labels
meanAndStd_Features <- grep("-[Mm]ean|-[Ss]td", cleanFeatures, value=TRUE)

##Subset X data on meanAndStd_Features
X_train.meanStd <- X_train[, meanAndStd_Features]
X_test.meanStd <- X_test[, meanAndStd_Features]


## Merge y data with activity label
y_test.merged <- merge(y_test, activity_labels, x.by = "V1", y.by = "V1")
y_train.merged <- merge(y_train, activity_labels, x.by = "V1", y.by = "V1")

##Rename y activites columns
names(y_test.merged) <- c("activityId", "activityLabel")
names(y_train.merged) <- c("activityId", "activityLabel")

##Rename subject columns
names(subject_train) <- c("subjectID")
names(subject_test) <- c("subjectID")


##Bind all columns together
subject_test.binded <- cbind(subject_test, y_test.merged, X_test.meanStd)
subject_train.binded <- cbind(subject_train, y_train.merged, X_train.meanStd)

##merge dataset
subjects <- rbind(subject_test.binded, subject_train.binded)


##https://www.r-statistics.com/tag/transpose/
##melt columns in rows
header <- c("subjectID", "activityId", "activityLabel")
subjects.melted <- melt(subjects, id = header)

##Summarize melted data
groupsHeader <- c("subjectID", "activityId", "activityLabel", "variable")
subjects.summary <- ddply(subjects.melted, groupsHeader, summarize, value=mean(value))

##remove activityId Column
subjects.summary$activityId <- NULL

subject.df <- as.data.frame(subjects.summary)

#Store data in a flat file
write.csv(subject.df, file = "subject.summary.csv", row.names = FALSE)

