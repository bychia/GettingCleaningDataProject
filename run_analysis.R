########################################################################
# Coursera Project: Getting and Cleaning Data
# Author: BY Chia
# Last modified: 24 Oct 2014
########################################################################

# Script tested in R Version 3.1.1

# Either of the following conditions must be satisfied in order for the script to run successfully
# 1. You have downloaded the UCI Har Dataset.zip and saved it in current working directory.
# 2. Or you have unzipped the UCI Har Dataset.zip in the current working directory.
# 3. Or you will need to have internet connection in order to download the dataset needed by this R-script.

# Project Settings / Dataset URL
dataset <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
datasetFile <- "getdata-projectfiles-UCI HAR Dataset.zip"
datasetFolder <- "UCI HAR Dataset"

# Check if dataset folder does not exist in current working directory
# (user could have downloaded & unzipped the dataset zip)
if(!file.exists(datasetFolder)){
  # Check if dataset zip does not exist in current working directory
  if(!file.exists(datasetFile)){
    download.file(dataset, datasetFile, method="curl")
  }
  # Unzip data
  unzip(datasetFile) 
}

# Reading Activites & Features data
activities <- read.table(file.path(datasetFolder, "activity_labels.txt"))
features <- read.table(file.path(datasetFolder, "features.txt"))

# Reading Train data
trainData <- read.table(file.path(datasetFolder, "train/X_train.txt"))
trainLabels <- read.table(file.path(datasetFolder, "train/y_train.txt"))
trainSubject <- read.table(file.path(datasetFolder, "train/subject_train.txt"))
trainData$label <- trainLabels$V1
trainData$subject <- trainSubject$V1

# Reading Test data
testData <- read.table(file.path(datasetFolder, "test/X_test.txt"))
testLabels <- read.table(file.path(datasetFolder, "test/y_test.txt"))
testSubject <- read.table(file.path(datasetFolder, "test/subject_test.txt"))
testData$label <- testLabels$V1
testData$subject <- testSubject$V1

########################################################################
# Req 1: Merges the training and the test sets to create one data set.
########################################################################
allData <- merge(testData, trainData, all=TRUE)

#Extend Feature list
features <- rbind(features,data.frame(V1=562:563, V2=c("label","subject")))

#Rename column names for testData and trainData
colnames(allData) <- features[[2]]


########################################################################
# Req 2: Extracts only the measurements on the mean and standard 
# deviation for each measurement. 
########################################################################
# Filter function
filterByWanted <- function(data){
  # Create a vector list from the column names of data
  colNames <- colnames(data)
  # Get the indexes of the features names which contain "mean" or "std"
  wantedColumns <- grep(pattern="mean|std|label|subject", x=colNames)
  # Discard feature names which contains "BodyBody" because it is not
  # mentioned in the features_info.txt
  unwantedColumns <- grep(pattern="BodyBody", x=colNames)
  # Get final wanted columns
  wantedColumns <- setdiff(wantedColumns, unwantedColumns)
  data[,wantedColumns]
}
# Start filtering the data
allData <- filterByWanted(allData)


########################################################################
# Req 3: Name the activities in the data set with descriptive names
########################################################################
#Substitue the label data to make it more descriptive
allData$label <- activities[match(allData$label, activities[[1]]) ,2]


########################################################################
# Req 4: Labels the data set with descriptive variable names. 
########################################################################
#Use Descriptive names
colNames <- colnames(allData)
colNames <- gsub(pattern="label","activity" ,x=colNames) 
colNames <- gsub(pattern="^t","time_" ,x=colNames)
colNames <- gsub(pattern="^f","freq_" ,x=colNames)
colNames <- gsub(pattern="Body", "Body_", x=colNames)
colNames <- gsub(pattern="Gravity", "Gravity_", x=colNames)
colNames <- gsub(pattern="Acc", "Acceleration_", x=colNames)
colNames <- gsub(pattern="Gyro", "Gyroscope_", x=colNames)
colNames <- gsub(pattern="Jerk", "Jerk_", x=colNames)
colNames <- gsub(pattern="Mag", "Magnitude_", x=colNames)
colNames <- gsub(pattern="-","_" ,x=colNames)
colNames <- gsub(pattern="__","_" ,x=colNames)
# Setting the column name correctly
colnames(allData) <- colNames


########################################################################
# Req 5: Get the average of each variable for each activity and subject.
########################################################################
tidyData <- aggregate(. ~ subject + activity, data=allData, FUN = mean)
write.table(tidyData, file="tidyData.txt", row.names=FALSE)
# Remove all used variables after running the script
rm(list=ls())

# Location of the Tidy Data set
print(paste("Tidy Data Set is written to:", file.path(getwd(), "tidyData.txt")))