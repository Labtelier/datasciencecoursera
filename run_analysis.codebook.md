#JHONS HOPKINS@Coursera Getting and Cleaning project submission



##Prerequisits
1. Set working directory to extracted data

##Inputs
	activity_labels.txt
	features.txt
	test/subject_test.txt
	test/X_test.txt
	test/y_test.txt
	test/Inertial Signals/body_acc_x_test.txt
	test/Inertial Signals/body_acc_y_test.txt
	test/Inertial Signals/body_acc_z_test.txt
	test/Inertial Signals/body_gyro_x_test.txt
	test/Inertial Signals/body_gyro_y_test.txt
	test/Inertial Signals/body_gyro_z_test.txt
	test/Inertial Signals/total_acc_x_test.txt
	test/Inertial Signals/total_acc_y_test.txt
	test/Inertial Signals/total_acc_z_test.txt
	train/subject_train.txt
	train/X_train.txt
	train/y_train.txt
	train/Inertial Signals/body_acc_x_train.txt
	train/Inertial Signals/body_acc_y_train.txt
	train/Inertial Signals/body_acc_z_train.txt
	train/Inertial Signals/body_gyro_x_train.txt
	train/Inertial Signals/body_gyro_y_train.txt
	train/Inertial Signals/body_gyro_z_train.txt
	train/Inertial Signals/total_acc_x_train.txt
	train/Inertial Signals/total_acc_y_train.txt
	train/Inertial Signals/total_acc_z_train.txt

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
Procude a subject.summary.csv file to the working directory

subjectID : 
	id of the people

activityLabel :
	WALKING
2
	WALKING_UPSTAIRS
3
	WALKING_DOWNSTAIRS
4
	SITTING
5
	STANDING
6
	LAYING


variable :
A matrice of mean and stddev for the following vector
	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag

value : Value corresponding to the tuple SubjectID/activityLabel/variable