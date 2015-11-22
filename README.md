# GettingAndCleaningData

## Course Project Repository

This repository is for course projet in Getting And Cleaning Data course.
Repository contains:

* README.md, this file
* UCI HAR Dataset, directory that contains all the data used in this course project
* run_analysis.R, R script that perform the analysis from source data
* tidy_data.txt, the result file of the analysis that holds tidy data set.
* CodeBook.md


### Running the analysis

#### Prerequisites

1. In order to get your script working, you need to install `dplyr`-packace to your R environment from the CRAN repository.
2. You need to have Samsung data (UCI HAR Dataset) together with `run_analysis.R`-script in your working directory.

#### run_analysis script

The script does the following steps:

1. It First reads the features file to get column names for data and fine tunes the feature names
  * Making names as CamelCase, removing parenthesis and replasing the t- and f-prefixes with Time and Freq prefixes
2. Then it reads the actual data
  * `X_train.txt`, `y_train.txt` and `subject_train` files for training data, training activities and training subject
  * `X_test.txt`, `y_test.txt` and `subject_train` files for testing data, testing activities and testing subject
3. After all needed data is read, it combines training and testing data sets by columnn, and finally training data set and testing data set are combined by rows.
4. After having all data combined to one data set, the measurements on the mean and standard deviation for each measurement extracted. 
5. Then activity names are read from file and activity values are replaced with activity names (stored as factor type) 
4. Finally independed data set is created that holds the average of each variable for each activity and each subject. Data set is created by using group_by and summarise_each functionalities from dplyr library and the result is written to `TidyData.txt` file.
  

