=================================================================================
Human Activity Recognition Using Smartphones Dataset
=================================================================================

The dataset includes the following files:
=========================================
- X_test: it has 2947 observations. Each observation is a vector of 561 variables (vector of features). 
- Y_test: it has 2947 observations. Each observation is a single value that refers to the label of the performed activity (1-6)
- subject_test: it has 2947 observations. Each observation is a single value that refers to the ID of the person who performed the data 
collection for the relevant vector in X_test (1-30)
The same logic goes to X_train, Y_train, and Subject_train. The train data has 7352 observations.

- features_info.txt: Shows information about the variables used on the feature vector.
- features.txt: List of all features.
- activity_labels.txt: Links the class labels with their activity name.

- tidy_data.txt: this file has the merged data from the train and the test data sets. It has 10299 observations. 
Tidy_data has been modified to have a column called “Person_ID” (it refers to the person who performed the activity), and a column 
called “Activity” (it refers to the performed activity). The rest of the columns are features that has mean or std calculation. 
Tidy_data.txt  has 10299 observations with 81 variables (Person_ID, Activity, and 79 features)

- Results_mean.txt contains the average of each variable from tidy_data.txt for each activity and each subject.


