## Study Design

Raw data used in this project are obtained from a UC Irvine project : Human Activity Recognition Using Smartphones Data Set. You can download the raw data here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Data obtained and processed in this project are presented as data frames following the variable or column names originally intended. The raw data have a total of 563 variables : "Subject", "Activity", and 561 features of time- and frequency domain variables. Data processing includes merging, subsetting, labeling, grouping and group-averaging (summarizing) of the raw data. The as-processed data will have variables representing the group averages (by "Subject" and "Activity") of the raw data. For claraification, the processed variables are renamed by appending "Group_Average" to their original variable names.

Data acquisition and the associated preprocessing are described in the README.txt that comes with the raw data package. You can also find more information about this UCI project at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#. The following is an excerpt of the README.txt regarding data acquisition and preprocessing :

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details."

All the raw data used in this course project come from the following 8 files in the data package:<br/>
<br/>
activity_labels.txt<br/>
features.txt<br/>
subject_train.txt<br/>
X_train.txt<br/>
y_train.txt<br/>
subject_test.txt<br/>
X_test.txt<br/>
y_test.txt<br/>


## Code Book

**Raw Data**

There are "Subject", "Activity" and 561 feature variables (total of 563 variables).<br/>
The 561 feature variables are based on 17 normalized physical variables (time- and frequency-domain data from accelerometers and gyroscopes): tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag; the rest of the features are the estimation/derivation from these 17 variables.<br/>
<br/>
All the 561 feature variables are normalized and bounded within [-1,1].<br/>
When variable names contain "Acc", the their units are the standard gravity unit "g" (9.8 ms^-2).<br/>
When variable names contain "Gyro", the their units are radians/second.<br/>

| Variable            | Type        | Range      | Unit     |
| ------------------- | ----------- | ---------- |--------- |
| Subject             | Integer     | [1,30]     | NA       |
| Activity            | Integer     | [1,6]      | NA       |
| tBodyAcc-XYZ        | Double      | [-1,1]     | g        |
| tGravityAcc-XYZ     | Double      | [-1,1]     | g        |
| tBodyAccJerk-XYZ    | Double      | [-1,1]     | g        |
| tBodyGyro-XYZ       | Double      | [-1,1]     | rad/sec  |
| tBodyGyroJerk-XYZ   | Double      | [-1,1]     | rad/sec  |
| tBodyAccMag         | Double      | [-1,1]     | g        |
| tGravityAccMag      | Double      | [-1,1]     | g        |
| tBodyAccJerkMag     | Double      | [-1,1]     | g        |
| tBodyGyroMag        | Double      | [-1,1]     | rad/sec  |
| tBodyGyroJerkMag    | Double      | [-1,1]     | rad/sec  |
| fBodyAcc-XYZ        | Double      | [-1,1]     | g        |
| fBodyAccJerk-XYZ    | Double      | [-1,1]     | g        |
| fBodyGyro-XYZ       | Double      | [-1,1]     | rad/sec  |
| fBodyAccMag         | Double      | [-1,1]     | g        |
| fBodyAccJerkMag     | Double      | [-1,1]     | g        |
| fBodyGyroMag        | Double      | [-1,1]     | rad/sec  |
| fBodyGyroJerkMag    | Double      | [-1,1]     | rad/sec  |


**Processed Data**

There are "Subject", "Activity" and 66 feature variables (total of 68 variables).<br/>
66 feature variables that are the estimation of mean and standard deviation, as shown by their variable names consisting of either "mean()" or "std()", are selcted out of the 561 features from the raw data, and put into a new data frame "selectedData". Data of the "selectedData" are grouped by "Subject" and "Activity", and the group averages of the selected features are calculated using the "summarize_all" function from the "dplyr" package. A new data frame "summaryData" is created to accomodate the grouped-and-averaged data. Variable/column names of the "summaryData" are appended with "Group_Average" for clarification.<br/>

The activity labels (2nd column) of the processed data frame summaryData are replaced with their corresponding verbal description, which is in the 2nd column of "activity_labels". The corresponding changes in the "Activity" variable is as follows :<br/>

| Variable            | Type        | Range                | Unit     |
| ------------------- | ----------- | -------------------- |--------- |
| Activity            | Character   | WALKING
              | NA       |
|                     |             | WALKING_UPSTAIRS     |          |
|                     |             | WALKING_DOWNSTAIRS   |          |
|                     |             | SITTING
              |          |
|                     |             | STANDING

             |          |
|                     |             | LAYING
               |          |
