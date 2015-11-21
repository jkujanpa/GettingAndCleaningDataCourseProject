# GettingAndCleaningData

## Course Project Repository

This repository is for course projet in Getting And Cleaning Data course.
Repository contains:

* README.md, this file
* UCI HAR Dataset, directory that contains all the data used in this course project
* run_analysis.R, R script that perform the analysis from source data
* tidy_data.txt, the result file of the analysis that holds tidy data set.
* CodeBook.md

### run_analysis()

  
1. Read the features file to get column names for data and then read the actual data with the column names. Finaly combine subjects, labels and set by columns. This is done for both training and test data. Then combine training data and test data by rows
2. Grep columns with mean or std in feature name from features. First column is the added label => increase columns by 1. Finally select activity label column and columns with mean or std -values
3. Read activity names from file. Index activity names with activity labels in dataset, and store as factor type 
4. Tidy the dataset by using group_by and summarise_each functionalities from dplyr library and write the result to file.
  
  
 
