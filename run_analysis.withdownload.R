##BEWARE!!!!!
##WHat is requested is :
##a tidy dataset AND NOT a file named tiny or tidy
##the tidy dataset must contains the mean group by
##-each variable
##-each activity
##-AND each subject

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

f <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "getdata projectfiles UCI HAR Dataset.zip")
unzip("getdata projectfiles UCI HAR Dataset.zip", overwrite = TRUE)


## Read activity and features labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table('UCI HAR Dataset/features.txt')


##clean features because special charactere produce issues due to ()
cleanFeatures  <- gsub("[()]", "", features[,2])

##Read test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")


##Read train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")


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
subjects.melted <- subset(subjects.melted, select=-c(activityId))

##Summarize melted data
groupsHeader <- c("subjectID", "activityLabel", "variable")
subjects.summary <- ddply(subjects.melted, groupsHeader, summarize, value=mean(value))
subjects.summary.casted <- dcast(subjects.melted, subjectID + activityLabel ~ variable, mean)


subjects.summary.df <- as.data.frame(subjects.summary)
subjects.summary.casted.df <- as.data.frame(subjects.summary.casted)

#Store data in a flat file
write.csv(subjects.summary.df, file = "tidy.txt", row.names = FALSE)
write.csv(subjects.summary.casted.df, file = "tidy.casted.txt", row.names = FALSE)




