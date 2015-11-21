run_analysis <- function() {

  # Step 1. Merge the training and the test sets to create one data set.
  # --------------------------------------------------------------------
  
  # Read features
  features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
  
  # Read training data
  trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, col.names = features$V2, check.names = TRUE)
  trainY <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = "tActivity")
  trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "tSubject")
  # Combine training subjects, labels and set by columns
  train <- cbind(trainSub, trainY, trainX)
  
  # Read test data
  testX <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = features$V2)
  testY <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "tActivity")
  testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "tSubject")
  # Combine test subjects, labels and set by columns
  test <- cbind(testSub, testY, testX)
  
  # Combine training data and test data by rows
  dataset <- rbind(train,test)
  
  
  # Step 2. Extract only the measurements on the mean and standard deviation for each measurement. 
  # ----------------------------------------------------------------------------------------------
  
  # Columns with mean or std in feature name from features
  columns <- grep("\\bmean\\b|\\bstd\\b",features$V2)
  # First column is the added label => increase columns by 1
  #columns <- columns + 1
  columns <- columns + 2
  # Add the label column
  #columns <- c(1, columns)
  columns <- c(1, 2, columns)
  
  # Select activity label column and columns with mean or std -values
  dataset <- dataset[columns]
  
  
  # Step 3. Use descriptive activity names to name the activities in the data set  
  # -----------------------------------------------------------------------------
  
  # Read activity names
  activity <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
  
  # Index activity names with activity labels in dataset, and store as factor type 
  dataset$tActivity <- as.factor(activity$V2[dataset$tActivity])
  
  
  # Step 4. Appropriately label the data set with descriptive variable names.
  # -------------------------------------------------------------------------
  
  # Done in Step 1 by adding col.names to read.table functions


  # Step 5. From the data set in step 4, create a second, independent tidy data set 
  # with the average of each variable for each activity and each subject.  
  # -------------------------------------------------------------------------------

  library(dplyr)
  dataset <- dataset %>% group_by(tSubject, tActivity) %>% summarise_each(funs(mean))

  write.table(dataset, file = "TidyData.txt", row.name=FALSE)
  
  
  
}