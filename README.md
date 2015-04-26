====================================================================================================================================================================================
====================================================================================================================================================================================
## This repository is for the Course Project of the Coursera course Getting and Cleaning Data (Module 3 of the Data Science Specialization).

It takes the data from the Human Activity Recognition Using Smartphones Dataset Version 1.0, which can be found here: 
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

When run, the R script provided in this repo (called "run_analysis.R") does the following things: 
1. it attaches the subject Id numbers and activity labels to the training and the test data sets from the raw data, and merges those 2 datasets together to create one data set.
2. it extracts only the measurements on the mean and standard deviation for each measurement. 
3. it changes the activity labels (numbers given in column 2 of the dataset) into descriptive activity names. 
4. it labels the data set with appropriate descriptive variable names
5. it creates a second, independent tidy data set (called "tidyDf2") with the average of each variable for each activity per subject. 
====================================================================================================================================================================================
====================================================================================================================================================================================


===============================================
# This repository includes the following files:
===============================================
1. README.md

2. CodeBook.md : describes the variables of the final tidy dataset that is made (tidyDf2), and describes the work and transformations that are performed to clean up the raw data.

3. run_analysis.R : the R script that can be used to create the new dataset. It contains very detailed comments about what is happening throughout the execution process. 

4. tidyDf2.txt : a .txt file containing the tidy new dataset (tidyDf2). 

5. tidyDf2.csv : a .csv file containing the tidy new dataset (tidyDf2). When opened on your computer, this file looks more readable then the .txt file, so if you want to investigate it I recommend you use this one. 

5. A folder called "raw data" which contains the full raw dataset as downloaded on 24-04-2015. This run_analysis.R script contains 
the code needed to download this full raw dataset yourself, but I've included it here as well for your convenience. The raw data folder
contains the following files: 
		- 'README.txt'
		- 'features_info.txt': Shows information about the variables used on the feature vector.
		- 'features.txt': List of all features.
		- 'activity_labels.txt': Links the class labels with their activity name.
		- 'train/X_train.txt': Training set.
		- 'train/y_train.txt': Training labels.
		- 'test/X_test.txt': Test set.
		- 'test/y_test.txt': Test labels.
		The following files for the train and test data. Their descriptions are equivalent. 
		- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
		- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
		- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
		- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 



================================================================================
# To read the R script, the following packages need to be installed in R:
================================================================================
- base
- utils
- plyr
- dplyr



======================================================================================================================================================
# Study Design / How the run_analysis.R SCRIPT works
======================================================================================================================================================


STEP A: I TOOK THE RAW DATA ZIPFILE FROM "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
PUT IT IN A FOLDER CALLED "cleaningAssignment" AND UNZIPPING THE FILE.


STEP B: I MADE A SEPARATE DATA FRAME FOR THE TRAIN DATA BY:
- making a vector of columnnames, taken from "features.txt".
- reading in and making a df of train data ("X_train.txt") called trainData, ascribing the vector of columnames as labels. 
- reading in and making df (with 1 column) of activity numbers for train data ("Y_train.txt"), and attaching it to the left side of trainData with cbind(), calling the new df trainDataAlmostComplete
- reading in and making df (with 1 column) of respondent ids for train data ("subject_train.txt"), and attaching it to the left side of trainDataAlmostComplete with cbind(), calling the new df trainDataComplete 


STEP C: I MADE A SEPARATE DATA FRAME FOR THE TEST DATA BY:
- reading in and making a df of test data ("X_test.txt") called testData, and naming the variables.
- reading in and making df (with 1 column) of activity numbers for test data ("Y_test"), and attaching it to the left side of testData with cbind(), calling the new df testDataAlmostComplete
- reading in and making df (with 1 column) of respondent ids for test data ("subject_test"), and attaching it to the left side of testDataAlmostComplete with cbind(), calling the new df testDataComplete


STEP D: I THEN MERGED THE TRAIN AND TEST DATA FRAME TOGETHER AND ARRANGED THE ROWS ACCORDING TO SUBJECT ID, BY DOING THIS: 
- mergedDf <- rbind(trainDataComplete,testDataComplete)
- mergedDf <- arrange(mergedDf,subjectId)


STEP E: I THEN MADE A NEW DATAFRAME (called "smallerDf"), CONTAINING ONLY THE NECESSARY COLUMNS 
- I first made a new data frame that only contained the first columns ("subjectId" and "activityNumbers") of the mergedDf data frame, so I could add the other necessary columns about the means and standard deviations (Which still need to be programmatically extracted from mergedDf) to it. 
- I then wrote a loop that goes over all the columns of mergedDf and reads the column names. If the name of the column contained the word "mean" or "std" the column was added to the smallerDf. 


STEP F: I THEN REPLACED THE ACTIVITY NUMBERS IN smallerDf[,2] WITH DESCRIPTIVE ACTIVITY NAMES
- first I changed the class of column 2 into 'character' so I can replace its values with other character strings (i.e. the descriptive activity names from "activity_labels.txt". 
- I then made a loop that goes over all the values of column 2 of smallerDf and replaces the numbers with the appropriate activity names as determined in "activity_labels.txt". 


STEP G: I THEN LABELED THE DATA SET (= smallerDf) WITH APPROPRIATE DESCRIPTIVE VARIABLE NAMES THAT ARE EASIER TO UNDERSTAND. 
- I did this programmatically, using the sub() function to replace abbreviations with the full words, remove unwanted punctuation marks, etc. The following replacements were made:
    "fBody" 		-> "featureOfBody"
    "tBody" 		-> "timeOfBody"
    "tGravity"		-> "timeOfGravity"
    "Jerk"		-> "JerkSignal"
    "Acc"		-> "Acceleration"
    "std()"		-> "StandardDeviation"
    "mean()"		-> "MeanValue"
    "Mag"		-> "Magnitude"
    "MeanValueFreq"	-> "MeanFreq" 
    "-X"		-> "X"
    "-Y"		-> "Y" 
    "-Z"		-> "Z"


STEP H:  I CREATED A SECOND, INDEPENDENT TIDY DATA SET DISPLAYING THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND SUBJECT 
- first I copied my previous dataset to a new variable called "tidyDf" that I could adjust to make my second tidy dataset (just to make sure the first one remains uncorrupted):
- then I used the group_by () function to group the dataset by subject Id and the type of activity (column 1 and 2). 
   And then I calculated the mean value of all the variables per subject per activity, using the summarise_each () function. The code I used for this operation is: 
    tidyDf2 <- tidyDf %>% group_by(subjectId, typeOfActivity) %>% summarise_each(funs(mean), vars=timeOfBodyAcceleration.MeanValue...X:featureOfBodyBodyGyroJerkSignalMagnitude.MeanFreq..)
- this resulted in a dataframe of 180 rows (30 subjects * 6 different activities = 180 records).
- the data frame "tidyDf2" now contains the second tidy dataset, showing the variable-averages for each subject per activity.


A MORE DETAILED DESCRIPTION OF THE STEPS, AS WELL AS THE FULL CODE CAN BE FOUND IN THE R SCRIPT "run_analysis.R". 








