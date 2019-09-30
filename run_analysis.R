
# Load the "dplyr" package
library(dplyr)

# Display 10 sig. fig. to check that the precision of the raw data is maintained throughout the processes.
options(digits = 10)


### STEP 1
### Merge the training and the test sets to create one data set :

features <- read.delim("./features.txt", header = FALSE, sep = "", dec = ".")
activity_labels <- read.delim("./activity_labels.txt", header = FALSE, sep = "", dec = ".")

subject <- read.delim("./subject_train.txt", header = FALSE, sep = "", dec = ".")
x <- read.delim("./X_train.txt", header = FALSE, sep = "", dec = ".")
y <- read.delim("./y_train.txt", header = FALSE, sep = "", dec = ".")

# Binding (column-binding) data in the training set.
trainData <- cbind(subject[, 1], y[, 1], x)

subject <- read.delim("./subject_test.txt", header = FALSE, sep = "", dec = ".")
x <- read.delim("./X_test.txt", header = FALSE, sep = "", dec = ".")
y <- read.delim("./y_test.txt", header = FALSE, sep = "", dec = ".")

# Binding (column-binding) data in the test set.
testData <- cbind(subject[, 1], y[, 1], x)

# Binding (row-binding) the training and test data sets into one data set.
mergedData <- rbind(trainData, testData)

# Assign proper column names to the merged data.
colnames(mergedData) <- c("Subject", "Activity", as.character(features[, 2]))



### STEP 2
### Extract only the measurements on the mean and standard deviation for each measurement :

vecColNames <- colnames(mergedData)
# Select the columns that contain column names of either "mean()" or "std()"
selectedFeats <- which(grepl("mean\\(\\)", vecColNames, ignore.case = T) | grepl("std\\(\\)", vecColNames, ignore.case = T))
# Keep the "Subject" and "Activity" columns
selectedCols <- c(1, 2, selectedFeats)

selectedData <- mergedData[, selectedCols]



### STEP 3
### Use descriptive activity names to name the activities in the data set :

# Coerce the labels in the extracted activity_labels data frame from "factor" to "character" data type. 
activity_labels[, 2] <- as.character(activity_labels[, 2])

# Replace the activity labels with their corresponding description.
for (idx in 1:length(selectedData$Activity)) {
  selectedData[idx, "Activity"] <- activity_labels[selectedData[idx, "Activity"], 2]
}



### STEP 4
### Appropriately label the data set with descriptive variable names :

# This has been implemented in STEP 1.
# Column names of "Subject" and "Activity" have been included.
# To repsect the Code Book from "features_info.txt" that comes with
# the data set, column names will be made identical to the feature names 
# provided in the "features.txt".




### STEP 5
### From the data set in STEP 4, create a second, independent 
### tidy data set with the average of each variable for
### each activity and each subject :

# Group the rows in the data frame by factors from the columns of "Subject" and
# "Activity", using the "group_by" function from the "dplyr" package.
selectedData <- group_by(selectedData, Subject, Activity)

# Apply the mean() function to all the variables of the groups.
# Create a new data frame based on the groups, using the "summarize_all" function
# from the "dplyr" package. Column names of the new data frame are appended
# with "Group_Average" for clarification.
summaryData <- summarize_all(selectedData, list(Group_Average = mean))


# When uncommented, the following script can be used to output
# the resulting data frame to a text file in the working directory.
# write.table(summaryData, "./step_5_data_set.txt", row.names = FALSE)




