# test data
subject_test<-read.table(file="./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
X_test<-read.table(file="./UCI HAR Dataset/test/X_test.txt",stringsAsFactors = FALSE)
Y_test<-read.table(file="./UCI HAR Dataset/test/Y_test.txt",stringsAsFactors = FALSE)

#train data
subject_train<-read.table(file="./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
X_train<-read.table(file="./UCI HAR Dataset/train/X_train.txt",stringsAsFactors = FALSE)
Y_train<-read.table(file="./UCI HAR Dataset/train/Y_train.txt",stringsAsFactors = FALSE)

#common data
activity_labels<-read.table(file="./UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE,col.names = c("ActivityId","Activity"))
features<-read.table(file="./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)

## step1.Merges the training and the test sets to create one data set.
#merge columns of test data
testDataset<-cbind(subject_test,
                   Y_test,
                   Bucket="test",
                   X_test)

#merge columns of train data
trainDataset<-cbind(subject_train,
                    Y_train,
                    Bucket="train",
                    X_train)

#merge rows of test and train data.
HAR<-rbind(testDataset,trainDataset)

## step4.Appropriately labels the data set with descriptive variable names. 
featurelist<-features[,2]
colnames(HAR)<-c("SubjectId",
                 "ActivityId",
                 "Bucket",
                 featurelist)

## step2.Extracts only the measurements on the mean and standard deviation for each measurement.
feature.selected<-featurelist[grepl("-mean\\(\\)-|-std\\(\\)-",featurelist)]
HAR<-HAR[,c("SubjectId","ActivityId","Bucket",feature.selected)]

## step3.Uses descriptive activity names to name the activities in the data set
HAR<-merge(x = HAR,y = activity_labels,by = "ActivityId")
HAR$Activity<-as.factor(HAR$Activity)

## step4. check the variable name and data type. 
str(HAR)

## step5. Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject.
library(data.table)
myHAR<-data.table(HAR)
HAR_Summary<-myHAR[,lapply(.SD,mean),.SDcols=feature.selected,by=list(SubjectId,Activity)]


## write the data to txt file. 
tidyDataFile<-"HAR_Tidy_Dataset.txt"
write.table(HAR,tidyDataFile, row.names = FALSE)

summaryDataFile<-"HAR_Summary_Dataset.txt"
write.table(HAR_Summary,summaryDataFile,row.names=FALSE)













