# Code Book

### Project Description

The purpose of this project is to demonstrate students ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


### The raw data

The original raw data and the description of the data given for this work can be found from [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Description of the variables in the TinyData.txt file

Accompanying file is a summary of given data which includes the Subject, Activity and Signal values.
Signals values are calculated from the original data as follows:

* Only mean and standard deviation signal values are included.
* Original mean and standard deviation signal values are grupped by subject and activity
* An Average value of the signal values is calculated for each group (30 subjects x 6 Activities = 180 groups) 


##### Subject
Identifies the subject who performed the activity for each window sample.

* range is from 1 to 30.


##### Activity 
Indicates the activity name that the subject has performed. Each person performed six activities 

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING


##### Signals

Signal names are:
* TimeBodyAcc[Mean|Std][XYZ]
* TimeGravityAcc[Mean|Std][XYZ]
* TimeBodyAccJerk[Mean|Std][XYZ]
* TimeBodyGyro[Mean|Std][XYZ]
* TimeBodyGyroJerk[Mean|Std][XYZ]
* TimeBodyAccMag[Mean|Std]
* TimeGravityAccMag[Mean|Std]
* TimeBodyAccJerkMag[Mean|Std]
* TimeBodyGyroMag[Mean|Std]
* TimeBodyGyroJerkMag[Mean|Std]
* FreqBodyAcc[Mean|Std][XYZ]
* FreqBodyAccJerk[Mean|Std][XYZ]
* FreqBodyGyro[Mean|Std][XYZ]
* FreqBodyAccMag[Mean|Std]
* FreqBodyAccJerkMag[Mean|Std]
* FreqBodyGyroMag[Mean|Std]
* FreqBodyGyroJerkMag[Mean|Std]

More detailed data about signal values can be found in original `features_info.txt` file

