Benoit de TARADE
Johns Hopkins@Coursera Data Cleaning project submission
=======================================================


#Review criteria
- The submitted data set is tidy.
- The Github repo contains the required scripts.
- GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
- The README that explains the analysis files is clear and understandable.
- The work submitted for this project is the work of the student who submitted it. I'm Benoit de TARADE-BENTINCK

##Scripts :
- run_analysis.R : Which response to my point of view of the requirement
- run_analysis.withdownload.R : Whiche was modified to :
	- Upload and unzip the source data
	- produce two files tidy.txt and tidy.casted.txt

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


