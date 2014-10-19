# Getting and Cleaning Data: Course Project

### Summary
The objective of this analysis was to collect, work with, and clean a data set, in order to prepare a tidy data set that can be used for later analysis. Data is collected from a group of 30 subjects (age from 19-48 years) using Samsung Galaxy S smartphone. 

The raw data is available here:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

The original source of the data is available below:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  

The 30 subjects have to perform 6 different physical activities. These activites
include walking, walking upstairs and downstairs, sitting, standing and laying.
The smartphones track volunteers' data from their waist using the phones' accelerometer and gyroscope.

In short, the data would be extracted, processed (clean and tidy) and transformed into a new tidy data set.


### run_analysis.R
The file run_analysis.R in this repository is used to perform the following:

* Initial setup
    
    * Create directory and set working directory
    
    * Download raw data (if not found in working directory) and unzip it

* Merges the training and the test sets to create one data set

* Extracts only the measurements on the mean and standard deviation for each measurement 

* Name the activities in the data set with descriptive names

* Labels the data set with descriptive variable names

* Get the average of each variable for each activity and subject

* Wrtie the clean data as .txt output


#### Running run_analysis.R
To run the run_analyis.R script, you do not need to setup anything. There is no prerequisite. Just download the script and run it. It will setup the initial working directory and download the raw dataset if necessary. 

All other procedures are commented in the script.


### Approach
Once the raw dataset is downloaded, the training and test data sets are loaded and then merged into one single data set using `merge`. 
The data sets contain alot of information but we are only interested in certain data. Cleaning is done on this data set to ensure that we only extract observations with the mean and standard deviation.

The data set is also labelled with a more descriptive column names using `grep` and `gsub` functions in R.
Lastly, `aggregate` function is applied on the data set to find the average of each variable for each activity and subject.

The final clean data is saved as tidydata.txt using `write.table` R function.

data set and how they were obtained is provided in the `CodeBook.md` file, 


### CodeBook
The `CodeBook.md` file, which can be found in this repository, explains the transformations performed and the 
resulting data and variables.

