==================================================================

This repository is for the Course Project of the Coursera course Getting and Cleaning Data (Module 3 of the Data Science Specialization).

It takes the data from the Human Activity Recognition Using Smartphones Dataset Version 1.0, which can be found here: 
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

When run, the R script provided in this repo (called "run_analysis.R") does the following things: 
1. it attaches the subject Id numbers and activity labels to the training and the test data sets from the raw data, and merges those 2 datasets together to create one data set.
2. it extracts only the measurements on the mean and standard deviation for each measurement. 
3. it changes the activity labels (numbers given in column 2 of the dataset) into descriptive activity names. 
4. it labels the data set with appropriate descriptive variable names
5. it creates a second, independent tidy data set (called "tidyDf2") with the average of each variable for each activity per subject. 

===========================================================================


This repository includes the following files:
=========================================
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


To read the R script, the following packages need to be installed in R:
===================================================================
- base
- utils
- plyr
- dplyr

================================================================================