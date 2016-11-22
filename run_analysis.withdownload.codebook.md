#JHONS HOPKINS@Coursera Getting and Cleaning project submission



##Prerequisits
1. Set working directory to extracted data
As it was requested.
It wasn't requested to download the file and unzip it.
(The code should have a file run_analysis.R in the main directory 
that can be run as long as the Samsung data is in your working directory)

##Inputs
	activity_labels.txt
	features.txt
	test/subject_test.txt
	test/X_test.txt
	test/y_test.txt
	train/subject_train.txt
	train/X_train.txt
	train/y_train.txt


##Process
	Read activity and features labels
	clean features because special charactere produce issues due to ()
	Read test data
	Read train data
	Apply features labels to x_train and x_test columns name
	Retrieve Mean and StDev labels
	Subset X data on meanAndStd_Features
	Merge y data with activity label
	Rename y activites columns
	Rename subject columns
	Bind all columns together
	merge dataset
	melt columns in rows
	Summarize melted data
	remove activityId Column
	Store data in a flat file

##Ouput
Procude two files
The first one tidy.txt is the same as for run_analysis.R
the seconde one a tidy.casted.txt file structured as follow

  Variables : 
    subjectID : 
      id of the people

    activityLabel :
      1 - WALKING
      2 - WALKING_UPSTAIRS
      3 - WALKING_DOWNSTAIRS
      4 - SITTING
      5 - STANDING
      7 - LAYING

    tBodyAcc-XYZ:
    tGravityAcc-XYZ:
    tBodyAccJerk-XYZ:
    tBodyGyro-XYZ:
    tBodyGyroJerk-XYZ:
    tBodyAccMag:
    tGravityAccMag:
    tBodyAccJerkMag:
    tBodyGyroMag:
    tBodyGyroJerkMag:
    fBodyAcc-XYZ:
    fBodyAccJerk-XYZ:
    fBodyGyro-XYZ:
    fBodyAccMag:
    fBodyAccJerkMag:
    fBodyGyroMag:
    fBodyGyroJerkMag:

    value : Value corresponding to the mean of the tuple SubjectID/activityLabel
