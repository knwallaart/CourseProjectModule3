### This script is for the Course Project of coursera course, module 3: Getting and Cleaning Data.

## STEP A: TAKING FILE FROM WEBSITE, PUTTING IT IN "cleaningAssignment" DIRECTORY, AND UNZIPPING THE FILE.
install.packages("utils")
library(utils)

if (!file.exists("cleaningAssignment")) {
    dir.create("cleaningAssignment")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="cleaningAssignment/samsung.zip")
list.files("cleaningAssignment/")
dateDownloaded <- date()
dateDownloaded

unzip("cleaningAssignment/samsung.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = "cleaningAssignment", unzip = "internal",
      setTimes = FALSE)


##########  STEP B: MAKING THE TRAIN DATA FRAME ###########################################################

# making a vector of columnnames, taken from "features.txt".
colNames <- read.table("cleaningAssignment/UCI HAR Dataset/features.txt", header=FALSE, sep="")
colNames <- as.vector (colNames[,2])
# reading in and making a df of train data ("X_train.txt") taking the colNames vector from above to name columns.
trainData <- read.table("cleaningAssignment/UCI HAR Dataset/train/X_train.txt", 
                        header=FALSE, sep="", col.names=colNames)


# making a character vector (length 1) containing the columnname for the activityNumbers dfs
activityNumbersColName <- "activityNumbers"
# reading in and making df (with 1 column) of activity numbers for train data ("Y_train.txt"), 
activityNumbersTrain <- read.table("cleaningAssignment/UCI HAR Dataset/train/Y_train.txt", 
                        header=FALSE, sep="", col.names=activityNumbersColName)
# and attaching it to the left side of trainData
trainDataAlmostComplete <- cbind(activityNumbersTrain,trainData)

# making a character vector (length 1) containing the columnname for the subjectId dfs
IdColName <- "subjectId"
# reading in and making df (with 1 column) of respondent ids for train data ("subject_train.txt"), 
subjectIdTrain <- read.table("cleaningAssignment/UCI HAR Dataset/train/subject_train.txt", 
                        header=FALSE, sep="", col.names=IdColName)
# and attaching it to the left side of trainDataAlmostComplete
trainDataComplete <- cbind(subjectIdTrain,trainDataAlmostComplete)




##########  STEP C: MAKING THE TEST DATE FRAME ###########################################################


# reading in and making a df of test data ("X_test.txt") taking the colNames vector (see train df) to name columns.
testData <- read.table("cleaningAssignment/UCI HAR Dataset/test/X_test.txt", 
                        header=FALSE, sep="", col.names=colNames)

# reading in and making df (with 1 column) of activity numbers for test data ("Y_test.txt"), 
activityNumbersTest <- read.table("cleaningAssignment/UCI HAR Dataset/test/Y_test.txt", 
                              header=FALSE, sep="", col.names=activityNumbersColName)
# and attaching it to the left side of testData
testDataAlmostComplete <- cbind(activityNumbersTest,testData)

# reading in and making df (with 1 column) of respondent ids for test data ("subject_test.txt"), 
subjectIdTest <- read.table("cleaningAssignment/UCI HAR Dataset/test/subject_test.txt", 
                        header=FALSE, sep="", col.names=IdColName)
# and attaching it to the left side of testDataAlmostComplete
testDataComplete <- cbind(subjectIdTest,testDataAlmostComplete)


##########  STEP D: MERGING THE TRAIN AND TEST DATA FRAME TOGETHER AND ARRANGING THE ROWS ACCORDING TO SUBJECT ID ###########################################################
library(plyr)
library(dplyr)

mergedDf <- rbind(trainDataComplete,testDataComplete)
mergedDf <- arrange(mergedDf,subjectId)

##########  STEP E: MAKE NEW DATAFRAME, CONTAINING ONLY THE NECESSARY COLUMNS ###########################################################

# make new data frame (called "smallerDf" containing only the first 2 columns ("subjectId" and "activityNumbers")
# so we can add the other necessary columns about means and standard deviations (Which still need to be programmatically extracted from mergedDf)
# to it. 
smallerDf <- mergedDf[,1:2]

# write a loop that goes over all the columns of mergedDf and reads the column names. If the name of the column contains the word 
# "mean" or "std" the column is added to the smallerDf. First 2 columns of mergedDf are already added to the smallerDf to begin with, so 
# loop index starts at 3. 

col_count <- dim(mergedDf) [2]
col_names <- names(mergedDf)

for (i in 3:col_count) {
    if (grepl("mean", col_names[i]) | grepl("std", col_names[i])) {
        smallerDf <- cbind(smallerDf,mergedDf[,i])
        # Names of the added columns disappeared after cbind, so had to add names afterwards. 
        colnames(smallerDf)[dim(smallerDf)[2]] <- col_names[i]
    }
}


##########  STEP F: REPLACE THE ACTIVITY NUMBERS IN smallerDf[,2] WITH DESCRIPTIVE ACTIVITY NAMES ###########################################################

# first I changed the class of column 2 into 'character' so I can replace its values with other character strings (i.e. the descriptive activity names from "activity_labels.txt". 
smallerDf[,2] <- as.character(smallerDf[,2])

# now I make a loop that goes over all the values of column 2 of smallerDf and replaces the numbers with the appropriate activity names as determined in "activity_labels.txt". 
row_count <- length(smallerDf[,2]) 
for (i in 1:row_count){
    if (smallerDf[i,2] == 1) {
        smallerDf[i,2] <- "WALKING"
    }
    if (smallerDf[i,2] == 2) {
        smallerDf[i,2] <- "WALKING_UPSTAIRS"
    }
    if (smallerDf[i,2] == 3) {
        smallerDf[i,2] <- "WALKING_DOWNSTAIRS"
    }
    if (smallerDf[i,2] == 4) {
        smallerDf[i,2] <- "SITTING"
    }
    if (smallerDf[i,2] == 5) {
        smallerDf[i,2] <- "STANDING"
    }
    if (smallerDf[i,2] == 6) {
        smallerDf[i,2] <- "LAYING"
    }
}

##########  STEP G: LABEL THE DATA SET (= smallerDf) WITH APPROPRIATE DESCRIPTIVE VARIABLE NAMES ###########################################################
library(base)

col_count <- dim(smallerDf) [2]
col_names <- names(smallerDf)

for (i in 1:col_count) {
    col_names[i] <- sub("fBody", "featureOfBody", col_names[i]) ;
    col_names[i] <- sub("tBody", "timeOfBody", col_names[i]) ; 
    col_names[i] <- sub("tGravity", "timeOfGravity", col_names[i]) ; 
    col_names[i] <- sub("Jerk", "JerkSignal", col_names[i]) ; 
    col_names[i] <- sub("Acc", "Acceleration", col_names[i]) ; 
    col_names[i] <- sub("std()", "StandardDeviation", col_names[i]) ; 
    col_names[i] <- sub("mean()", "MeanValue", col_names[i]) ; 
    col_names[i] <- sub("Mag", "Magnitude", col_names[i]) ; 
    col_names[i] <- sub("MeanValueFreq", "MeanFreq", col_names[i]) ; 
    col_names[i] <- sub("-X", "X", col_names[i]) ; 
    col_names[i] <- sub("-Y", "Y", col_names[i]) ; 
    col_names[i] <- sub("-Z", "Z", col_names[i]) ; 
    col_names[i] <- sub("activityNumbers", "typeOfActivity", col_names[i])
    
    colnames(smallerDf)[i] <- col_names[i];
}

# smallerDf is now a tidy dataset 

# If you want: below is the code to export the smallerDf dataframe to a csv file or txt file in the cleaningAssignment folder on your computer.
# write.csv2(smallerDf, file="cleaningAssignment/smallerDf.csv",col.names=TRUE)
# write.table(smallerDf,file="cleaningAssignment/smallerDf.txt", row.names=FALSE)


##########  STEP H:  CREATE A SECOND, INDEPENDENT TIDY DATA SET DISPLAYING THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND SUBJECT ###########################################################

# First I copy my previous dataset to a new variable that I can adjust to make my second tidy dataset (just to make sure the first one remains uncorrupted):

tidyDf <- smallerDf

# Then I group the dataset by subject Id and the type of activity (column 1 and 2) and then I calculate the mean value of all the variables per subject per activity. 
# This results in a dataframe of 180 rows (30 subjects * 6 different activities = 180 records). It is created with the following operation(s): 
tidyDf2 <- tidyDf %>% group_by(subjectId, typeOfActivity) %>% summarise_each(funs(mean), vars=timeOfBodyAcceleration.MeanValue...X:featureOfBodyBodyGyroJerkSignalMagnitude.MeanFreq..)

# for some reason I lose the column names while doing this operation so I remedy this by copying the column names from the 
# tidyDf dataframe and pasting them on the tidyDf2 dataframe. 
names(tidyDf2) <- names(tidyDf)
# tidyDf2 now contains the second tidy dataset, showing the variable-averages for eacht subject per activity.

# If you want: below is the code to export the tidyDf2 dataframe to a csv file or txt file in the cleaningAssignment folder on your computer.
write.csv2(tidyDf2, file="cleaningAssignment/tidyDf2.csv",col.names=TRUE)
write.table(tidyDf2,file="cleaningAssignment/tidyDf2.txt", row.names=FALSE)
