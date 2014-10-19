# Tested in R Version 3.1.1
# Project Settings / Dataset URL
projectName <- "DataCleaning_Project"
dataset <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Check if current directory variable exists
if(!exists("currentDir"))
  currentDir <- file.path(getwd(),projectName)

# Check if directory exists
if(!file.exists(currentDir))
  dir.create(currentDir)

# Check if current working directory equals to currentDir
if(getwd()!= currentDir){
  setwd(currentDir)
  print(paste("Set Working Directory to:", currentDir))
}

# Check if dataset exists in currentDir
if(!file.exists(file.path(currentDir,"dataset.zip"))){
  download.file(dataset, "dataset.zip", method="curl")
  # Unzip data
  unzip("dataset.zip") 
}

# Reading Activites & Features data
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# Reading Train data
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainData$label <- trainLabels$V1
trainData$subject <- trainSubject$V1

# Reading Test data
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
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
  #Get the indexes of the features names which contain "mean" or "std"
  wantedColumns <- grep(pattern="mean|std|label|subject", x =colnames(data))
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
print(paste("Tidy Data Set is written to:", paste(currentDir, "tidyData.txt", sep="/")))
