run_analysis <- function()
{
  
  setwd("C:/Users/baselk/Desktop/School exams/Course project")
  
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  ###################################
  
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  ######################################
  ######################################
  # Task 1
  
  mergedata <- rbind(X_train,X_test)  # merge train and test datasets 
  # now change the name of the columns to the features'names names instead of V1 to V561 
  features_names <- read.table("./UCI HAR Dataset/features.txt")   # find the names of the features
  # fix the names of the vaiables in the mergedata
  for (i in 1:ncol(mergedata)) {
    names(mergedata)[i] <- as.character(features_names[i,"V2"])
  }
  
 ######################################
 ######################################
 # Task 2
  
  #find the names of the features that contain mean or std
 targetnames <- grep (".*mean.*|.*std.*", names(mergedata),value = TRUE)
  
  #create a a new table from mergedata with the appropriate values (only features with mean or std)
  meanStd <- data.table(mergedata[,targetnames])
  
  #now meanStd has the right columns names

 ######################################
 ######################################
 # Task 3
 
 mergelabels <- rbind(Y_train,Y_test)  # merge train and test labels
 #read the labels of activities
 activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
 #change the names of the lables in mergelabels based on the names presented in activity_labels
 mergelabels[,"V1"] <- activity_labels[mergelabels[,"V1"],"V2"]
 names(mergelabels) <- "Activity"  # change the name of the column to Activity instead of V1
  
 ######################################
 ######################################
 # Task 4
 # we have now meanStd with the right features, mergelabels with the right activities. Lets merge the subjects and add everything together 
 # in 1 tidy_data and write them into txt file
 mergesubjects <- rbind(subject_train,subject_test) #merge train and test subjects 
 names(mergesubjects) <- "Person_ID"  #change the name of the column to Person_ID instead of V1 
 
 #////////////////////////////////////////////
 #combine the files in 1 tidy data file 
 tidy_data <- cbind(mergesubjects,mergelabels,meanStd)
 
 #save the data in .txt file
 write.table(tidy_data,"./UCI HAR Dataset/Results/tidy_data.txt")
 
 # now we have tidy_data.txt that contains desprective columns names, the title of the activities instead of numbers, and 81 columns
 # the 81 columns are "Person_ID", "Activity", and the 79 features that are related to mean or std. the file contains 10299 instances
 ######################################
 ######################################
 # Task 5
 
 require(dplyr)
 # we apply ddply on the tidy data. We pass the data and then the valiables that we want to split the data based on, and then the function
 # Results_mean contains 180 instances (30 persons and 6 activities)
 # We put x[,3:81] to ignore the first 2 columns when calculating the mean (the first 2 columns are Person_ID and Activity)
 Results_mean <- ddply(tidy_data, .(Person_ID, Activity), function(x) colMeans(x[,3:81]))
 
 # we can write the final results in a CSV file for readability 
 write.csv(Results_mean, file = "./UCI HAR Dataset/Results/Results_mean.csv")
 
}