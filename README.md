To run the analysis in this course project you should have the latest version of R or RStudio. The run_analysis.R 
script attached in the GitHub repository was tested using RStudio version 1.2.1335 installed on a Windows 8 operating 
system. You should also install the "dplyr" package in R/RStudio.

## The step-by-step recipe for this data processing/analysis is as follows :

1.
There should be 9 files in the R/RStudio's working directory.
The R script to run in R/RStudio is : run_analysis.R
The raw data files can be downloaded from the link provided on the course webpage : 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. You will first need to unzip 
the package and then identify the files in the unzipped folders. Please place the following 9 files in R/RStudio's 
working directory :

run_analysis.R
activity_labels.txt
features.txt
subject_train.txt
X_train.txt
y_train.txt
subject_test.txt
X_test.txt
y_test.txt

2.
Install the "dplyr" package in R/RStudio, by running the script : install.packages("dplyr")

3.
You will then be able to run the run_analysis.R script and obtain the as-resulted data frame called "summaryData" in the R/RStudio's environment. 


Details of run_analysis.R :
(also in the comments of the script)

1. Loads the "dplyr" package
2. Sets R/RStudio's numerical display to 10 significant digits, to check that the precision of the raw data is maintained throughout the processes.
STEP 1
3. Reads the 8 raw data files into 8 data frames.
4. Binds (column-binds) the data frames from "training set" into "trainData".
5. Binds (column-binds) the data frames from "test set" into "testData".
6. Binds (row-binds) the "trainData" and "testData" into "mergedData".
7. Assigns proper column names such as "Subject", "Activity" and the feature names read from features.txt to "mergedData".
STEP 2
8. Selects the columns of "mergedData" with column names matching "mean()" or "std()"; constructs a new data frame 

called "selectedData" for the selected columns; keeps the "Subject" and "Activity" columns.
STEP 3
9. Coerces the labels in the extracted "activity_labels" data frame from "factor" to "character" data type; replaces 

the activity labels in "selectedData" with their corresponding verbal description, which is in the 2nd column of 

"activity_labels".
STEP 4
10. Column names of "Subject" and "Activity" have been included. To repsect the Code Book from features_info.txt 

that comes with the data set, column names will be made identical to the feature names provided in the features.txt.
STEP 5
11. Groups the rows in the data frame by factors from the columns of "Subject" and "Activity", using the "group_by" 

function from the "dplyr" package.
12. Applies the "mean()" function to all the variables of the groups; creates a new data frame based on the groups, 

using the "summarize_all" function from the "dplyr" package; column names of the new data frame are appended with 

"Group_Average" for clarification.
13. The result is in the data frame "summaryData".




