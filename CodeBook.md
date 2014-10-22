# Tidy Data Set
The cleaned data (tidyData.txt) in the repository contains 180 observations and 72 variables. 
Among the 72 variables, 70 of them are from the `features_info.txt`. The other 2 variables are from `y_test.txt` and `subject_test.txt`; representing the type of activity and the subject ids for the corresponding observations respectively.

The type of activities include:

* laying
* sitting
* standing
* walking
* wakling_downstairs
* walking upstairs

The subject ID [1 to 30] gives the volunteer an unique ID for the data set.

Each of the other 70 variables of the measurement includes several components which indicate the following:

* time: measurement in time domain
* freq: measurement in frequency domain
* Body: body acceleration signal
* Gravity: gravity acceleration signal
* Acceleration: senor signal from accelerometer
* Gyroscope: senor signal from gyroscope 
* Magnitude: 3D magnitude signal in X, Y or Z direction
* Jerk: Time rate of change of acceleration

Even though we have a range of measurements from the dataset (see below), we only retain variables relating to `mean()` and `std()` as required by the project.

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.


### UCI HAR Dataset
The following files and folders are available in the dataset.zip.
1. test/
2. train/
3. activity_labels.txt
4. features_info.txt

Below is the full description of what these files and folders meant. 
This is necessary for us to understand in order to extract and tidy the data sets to obtain what we need.

### test/
This folder contains the following files:

* X_test.txt: The main data set with data from the `features_info.txt`.

* y_test.txt: The activity id which corresponds with `activity_labels.txt`.

* subject_test.txt: The subject id which corresponds with each of the observations from `X_test.txt`.

### train/
This folder contains the following files:

* X_train.txt: The main data set with data from the `features_info.txt`.

* y_train.txt: The activity id which corresponds with `activity_labels.txt`.

* subject_train.txt: The subject id which corresponds with each of the observations from `X_train.txt`.


### activity_labels.txt
This file contains the description of the activity from the raw data.
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### features_info.txt
This file contains a full labels of all the variable names from the `test/X_test.txt` and `train/X_train.txt`.
For more information, see below for the raw data variable definition.

# Raw Data Variable Definition

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean