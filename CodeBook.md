## RawData
[UCI_HAR_Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Step1. Read the test and train data from the fllowing files. 
- 'train/subject_train.txt' and 'test/subject_test.txt' : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/X_train.txt': Training set, contains 561 features which correlated with the features listed in file 'feature.txt'.
- 'train/y_train.txt': Training labels,ActivityId which indicates the Activity listed in file 'activity_labels.txt'.
- 'test/X_test.txt': Test set, same as Training set. 
- 'test/y_test.txt': Test labels, same as Training labels. .

### Step2. Merge Data
1. Merge the Subject, ActivityId and 561 feature values of test and train together. And add a column to indicate its bucket. 
2. Extract the feature names from 'feature.txt' to label to feature variable. 

### Step3. Select Data.
Only keep the features that contains "-mean()-" or "-std()-"

### Step3. Add Activity Column
Select the Activity Name from 'activity_labels.txt' and join with the Merge Data by ActivityId,finally convert the Activity Name to a factor. 

Save the final Tidy Dataset to a txt file. 

### Step4. Calculate the average of feature values.
Group the selected feature values by SubjectId and Activity, and then calculate the average value. 
Save the Summary Dataset to another txt file. 

## Schema of the Tidy Dataset. 
* ActivityId  int,  Extracted from the file 'Y_train.txt' and 'Y_test.txt'
* SubjectId   int,  Extracted from the file 'train/subject_train.txt' and 'test/subject_test.txt' range from 1 to 31 indicates the 30 volunteers
* Bucket      Factor, The value is 'test' or 'train' to indicate which bucket is the data from. 
* [48 features] numeric, Measurements on the mean and standard deviation for each measurement.The values have been normalized and bounded within [-1,1].
* Activity     Factor, Activity Name extracted from 'activity_labels.txt'

## Schema of the Summary Dataset
* SubjectId     
* Activity
* [48 features] The values is the average of the feature for each activity and subject. 

## 48 selected features
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z

## Comments from my classmates
peer 1 → The code book (not "cook" book) is not just a list of the variables and the steps taken to process them. You need to explain where the original data came from, what it means, and what the variables actually measure. For example, it would be really useful to explain that these measurements are from the accelerometer in a smartphone, and that all mean/std measurements are derived from more basic measurements. The easiest way to do this is to copy some of the information from the original data set's features_info file. You should also have explained what the 48 selected features actually meant. By the way, there should be 66 selected features that used mean() or std(). Your grep functions require a hyphen ('-') to occur after the mean()/std(), but there were some features that had mean at the end of the variable name, so there was no hyphen at the end. Technically, this made your script run the incorrect analysis, but I thought it was minor enough that I only took marks off for the codebook.

peer 2 → I gave 6 for the data set tidiness because point 4 (give clean names to the variables) was not done and was stubbed in a script. Besides, two data sets were submitted while it was only required to submit one (well it's a minor thing). I gave 6 for the code book because instead of describing the overall repo and code structure and the algorithms in Readme.md and the variables in CodeBook.md there was a file named CookBook.md with mixed algorithm and data. I think everything should be tidy, not only the dataset.



