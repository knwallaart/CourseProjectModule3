======================================================================================================================================================
======================================================================================================================================================
### CODEBOOK FOR COURSE PROJECT OF THE COURSERA COURSE GETTING AND CLEANING DATA - REPOSITORY "CourseProjectModule3"
======================================================================================================================================================
======================================================================================================================================================



======================================================================================================================================================
##DESCRIPTION OF THE VARIABLES
======================================================================================================================================================


The dataset that is created with the help of the 'run_analysis R script' contains 81 variables. 
These variables are a selection from the 563 variables that were used in the raw dataset (for the full list see the 'features.txt' file in the 'raw data' folder), 
and only the variables about the means and standard deviations of measurements were selected. The names of these variables were then changed to improve readability for
the user. In the final data set variables nr. 3 until 81 give the mean or standard deviation for a particular measurement per subject per activity.
Below, a description of the variables in the raw data is given as background information to understand what the variables mean and what measurements were taken. 
After that, a list of the variables that were selected from the raw data to use for the new dataset is given. Lastly, the final list of variables of the final tidy data set (tidyDf2)
is given. This list contains the subjects' ID numbers (column 1), the type of activity (column 2) and the means of the variable measurements per subject per activity. 
!! Note that this is different from the measurements recorded in the raw dataset, which are seperate measurements per time increment(2.56 sec) !!


===========================================================================
#Description of the variables in the raw dataset: 
===========================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers 
was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore 
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain. See 'features_info.txt' for more details. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at
a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, 
the acceleration signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived 
in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated 
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag,
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


===========================================================================
#List of the raw data's variables that are used in the process of making the final tidy dataset (tidyDf2): 
===========================================================================
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
294 fBodyAcc-meanFreq()-X
295 fBodyAcc-meanFreq()-Y
296 fBodyAcc-meanFreq()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
373 fBodyAccJerk-meanFreq()-X
374 fBodyAccJerk-meanFreq()-Y
375 fBodyAccJerk-meanFreq()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
452 fBodyGyro-meanFreq()-X
453 fBodyGyro-meanFreq()-Y
454 fBodyGyro-meanFreq()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
513 fBodyAccMag-meanFreq()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
526 fBodyBodyAccJerkMag-meanFreq()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
539 fBodyBodyGyroMag-meanFreq()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()
552 fBodyBodyGyroJerkMag-meanFreq()



===========================================================================
#List of the renamed variables that are actually used in the final tidy dataset (tidyDf2): (Order correspond to the list of the raw data's variables). 
 Variables nr. 3 until 81 give the mean or standard deviation for a particular measurement per subject per activity.
===========================================================================
1  "subjectId"
2  "typeOfActivity"
3  "timeOfBodyAcceleration.MeanValue...X"
4  "timeOfBodyAcceleration.MeanValue...Y"
5  "timeOfBodyAcceleration.MeanValue...Z"
6  "timeOfBodyAcceleration.StandardDeviation...X"
7  "timeOfBodyAcceleration.StandardDeviation...Y"
8  "timeOfBodyAcceleration.StandardDeviation...Z"
9  "timeOfGravityAcceleration.MeanValue...X"
10 "timeOfGravityAcceleration.MeanValue...Y"
11 "timeOfGravityAcceleration.MeanValue...Z"
12 "timeOfGravityAcceleration.StandardDeviation...X"
13 "timeOfGravityAcceleration.StandardDeviation...Y"
14 "timeOfGravityAcceleration.StandardDeviation...Z"
15 "timeOfBodyAccelerationJerkSignal.MeanValue...X"
16 "timeOfBodyAccelerationJerkSignal.MeanValue...Y"
17 "timeOfBodyAccelerationJerkSignal.MeanValue...Z"
18 "timeOfBodyAccelerationJerkSignal.StandardDeviation...X"
19 "timeOfBodyAccelerationJerkSignal.StandardDeviation...Y"
20 "timeOfBodyAccelerationJerkSignal.StandardDeviation...Z"
21 "timeOfBodyGyro.MeanValue...X"
22 "timeOfBodyGyro.MeanValue...Y"
23 "timeOfBodyGyro.MeanValue...Z"
24 "timeOfBodyGyro.StandardDeviation...X"
25 "timeOfBodyGyro.StandardDeviation...Y"
26 "timeOfBodyGyro.StandardDeviation...Z"
27 "timeOfBodyGyroJerkSignal.MeanValue...X"
28 "timeOfBodyGyroJerkSignal.MeanValue...Y"
29 "timeOfBodyGyroJerkSignal.MeanValue...Z"
30 "timeOfBodyGyroJerkSignal.StandardDeviation...X"
31 "timeOfBodyGyroJerkSignal.StandardDeviation...Y"
32 "timeOfBodyGyroJerkSignal.StandardDeviation...Z"
33 "timeOfBodyAccelerationMagnitude.MeanValue.."
34 "timeOfBodyAccelerationMagnitude.StandardDeviation.."
35 "timeOfGravityAccelerationMagnitude.MeanValue.."
36 "timeOfGravityAccelerationMagnitude.StandardDeviation.."
37 "timeOfBodyAccelerationJerkSignalMagnitude.MeanValue.."
38 "timeOfBodyAccelerationJerkSignalMagnitude.StandardDeviation.."
39 "timeOfBodyGyroMagnitude.MeanValue.."
40 "timeOfBodyGyroMagnitude.StandardDeviation.."
41 "timeOfBodyGyroJerkSignalMagnitude.MeanValue.."
42 "timeOfBodyGyroJerkSignalMagnitude.StandardDeviation.."
43 "featureOfBodyAcceleration.MeanValue...X"
44 "featureOfBodyAcceleration.MeanValue...Y"
45 "featureOfBodyAcceleration.MeanValue...Z"
46 "featureOfBodyAcceleration.StandardDeviation...X"
47 "featureOfBodyAcceleration.StandardDeviation...Y"
48 "featureOfBodyAcceleration.StandardDeviation...Z"
49 "featureOfBodyAcceleration.MeanFreq...X"
50 "featureOfBodyAcceleration.MeanFreq...Y"
51 "featureOfBodyAcceleration.MeanFreq...Z"
52 "featureOfBodyAccelerationJerkSignal.MeanValue...X"
53 "featureOfBodyAccelerationJerkSignal.MeanValue...Y"
54 "featureOfBodyAccelerationJerkSignal.MeanValue...Z"
55 "featureOfBodyAccelerationJerkSignal.StandardDeviation...X"
56 "featureOfBodyAccelerationJerkSignal.StandardDeviation...Y"
57 "featureOfBodyAccelerationJerkSignal.StandardDeviation...Z"
58 "featureOfBodyAccelerationJerkSignal.MeanFreq...X"
59 "featureOfBodyAccelerationJerkSignal.MeanFreq...Y"
60 "featureOfBodyAccelerationJerkSignal.MeanFreq...Z"
61 "featureOfBodyGyro.MeanValue...X"
62 "featureOfBodyGyro.MeanValue...Y"
63 "featureOfBodyGyro.MeanValue...Z"
64 "featureOfBodyGyro.StandardDeviation...X"
65 "featureOfBodyGyro.StandardDeviation...Y"
66 "featureOfBodyGyro.StandardDeviation...Z"
67 "featureOfBodyGyro.MeanFreq...X"
68 "featureOfBodyGyro.MeanFreq...Y"
69 "featureOfBodyGyro.MeanFreq...Z"
70 "featureOfBodyAccelerationMagnitude.MeanValue.."
71 "featureOfBodyAccelerationMagnitude.StandardDeviation.."
72 "featureOfBodyAccelerationMagnitude.MeanFreq.."
73 "featureOfBodyBodyAccelerationJerkSignalMagnitude.MeanValue.."
74 "featureOfBodyBodyAccelerationJerkSignalMagnitude.StandardDeviation.."
75 "featureOfBodyBodyAccelerationJerkSignalMagnitude.MeanFreq.."
76 "featureOfBodyBodyGyroMagnitude.MeanValue.."
77 "featureOfBodyBodyGyroMagnitude.StandardDeviation.."
78 "featureOfBodyBodyGyroMagnitude.MeanFreq.."
79 "featureOfBodyBodyGyroJerkSignalMagnitude.MeanValue.."
80 "featureOfBodyBodyGyroJerkSignalMagnitude.StandardDeviation.."
81 "featureOfBodyBodyGyroJerkSignalMagnitude.MeanFreq.."




======================================================================================================================================================
##STUDY DESIGN
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





