run_analysis <- function() {

  # Load needed libraries
  library(dplyr)
  
  
  # Step 1. Merge the training and the test sets to create one data set.
  # --------------------------------------------------------------------
  
  # Read features
  features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
  
  # Fine tune the feature names
  # - replace t prefix with Time
  features$V2 <- gsub("^t", "Time", features$V2)
  # - replace f prefix with Freq
  features$V2 <- gsub("^f", "Freq", features$V2)
  # - replace "-mean" with Mean
  features$V2 <- gsub("-mean", "Mean", features$V2)
  # - replace "-std" with Std
  features$V2 <- gsub("-std", "Std", features$V2)
  # - remove -"
  features$V2 <- gsub("-", "", features$V2)
  # - remove "()"
  features$V2 <- gsub("[(][)]", "", features$V2)
  
  # Read training data
  trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, col.names = features$V2, check.names = TRUE)
  trainY <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = "Activity")
  trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "Subject")
  # Combine training subjects, labels and set by columns
  train <- cbind(trainSub, trainY, trainX)
  
  # Read test data
  testX <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = features$V2)
  testY <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "Activity")
  testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "Subject")
  # Combine test subjects, labels and set by columns
  test <- cbind(testSub, testY, testX)
  
  # Combine training data and test data by rows
  dataset <- rbind(train,test)
  
  
  # Step 2. Extract only the measurements on the mean and standard deviation for each measurement. 
  # ----------------------------------------------------------------------------------------------
  
  # Columns with mean or std in feature name from features
  #columns <- grep("\\bMean\\b|\\bStd\\b",features$V2)
  columns <- grep("Mean[XYZ]$|Mean$|Std[XYZ]$|Std$",features$V2)
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
  dataset$Activity <- as.factor(activity$V2[dataset$Activity])
  
  
  # Step 4. Appropriately label the data set with descriptive variable names.
  # -------------------------------------------------------------------------
  
  # Done in Step 1 by adding col.names to read.table functions
  

  # Step 5. From the data set in step 4, create a second, independent tidy data set 
  # with the average of each variable for each activity and each subject.  
  # -------------------------------------------------------------------------------

  #
  dataset <- dataset %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

  write.table(dataset, file = "TidyData.txt", row.name=FALSE)
  
}