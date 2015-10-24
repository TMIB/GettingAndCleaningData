
##Check for installed packages. Citation for this code:
##http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
list.of.packages <- c("dplyr", "ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) {install.packages(new.packages)} 
require(dplyr)

##We assume that you have downloaded the data file, and are currently in the 
##"UCI HAR Dataset" directory
if (!file.exists("activity_labels.txt") & !file.exists(file.path("train","subject_train.txt")))
{
     stop('cannot find correct files. Current working directory is:', getwd())
}

##read in the text files with the data for the 30 different subjects that participated
subjectTrain <-read.table(file.path("train", "subject_train.txt"), header=FALSE)
subjectTest <-read.table(file.path("test", "subject_test.txt"), header=FALSE)

##read in the text files with the data for the training set and labels
xTrain <- read.table(file.path("train", "X_train.txt"), header=FALSE)
yTrain <- read.table(file.path("train", "Y_train.txt"), header=FALSE)

##read in the text files with the data for the test set and labels
xTest <- read.table(file.path("test", "X_test.txt"), header=FALSE)
yTest <- read.table(file.path("test", "Y_test.txt"), header=FALSE)

##read in the list of features
features <- read.table("features.txt", header=FALSE)

##rename the columns in the training set and test sets to match the feature names
colnames(xTrain)<-features$V2
colnames(xTest)<-features$V2

colnames(yTrain)<-"label"
colnames(yTest)<-"label"
colnames(subjectTrain)<-"subject"
colnames(subjectTest)<-"subject"

##combine the training datasets, then the test datasets
train<-cbind(subjectTrain, yTrain, xTrain)
test<-cbind(subjectTest, yTest, xTest)

##remove duplicate columns
train <- train[, !duplicated(colnames(train))]
test <- test[, !duplicated(colnames(test))]

##add a "type" column to indicate which type of data is being presented
train<-mutate(train, type="train")
test<-mutate(test, type="test")

##row bind the training and test datasets into a new dataset
## this meets assignment requirement 1:
## "Merges the training and the test sets to create one data set"
fullSet<-rbind(train, test)

##Extract the mean and standard deviation measurements
## this meets assignment requirement 2:
## "Extracts only the measurements on the mean and standard deviation for each measurement."
meanStdMeasurements <-select(fullSet, type, subject, label, contains("mean"), contains("std"))

## set the labels in the meanStdMeasurements to match those in the activity labels file.
## this meets assignment requirement 3:
## "Uses descriptive activity names to name the activities in the data set"

##TODO: This is currently hardcoded. Better to read the labels dynamically from activity_labels.txt
## activityLabels<-read.table("activity_labels.txt", header=FALSE) 
meanStdMeasurements$label<-factor(meanStdMeasurements$label, levels=1:6,
                      labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING",
                               "LAYING"))

## label the data set with friendly variable names
## this meets assignment requirement 4:
## "Appropriately labels the data set with descriptive variable names."
relabeledMeanStdMeasurements<-gsub ("tBody", "TimeBody", names(meanStdMeasurements), ignore.case=FALSE)
relabeledMeanStdMeasurements<-gsub ("tGravity", "TimeGravity", relabeledMeanStdMeasurements, ignore.case=FALSE)
relabeledMeanStdMeasurements<-gsub ("Mag", "Magnitude", relabeledMeanStdMeasurements, ignore.case=FALSE)
relabeledMeanStdMeasurements<-gsub ("Gyro", "Gyroscope", relabeledMeanStdMeasurements, ignore.case=FALSE)
relabeledMeanStdMeasurements<-gsub ("Acc", "Accelerometer", relabeledMeanStdMeasurements, ignore.case=FALSE)
relabeledMeanStdMeasurements<-gsub ("fBody", "FastFourierTransformBody", relabeledMeanStdMeasurements, ignore.case=FALSE)
relabeledMeanStdMeasurements<-gsub ("Freq", "Frequency", relabeledMeanStdMeasurements, ignore.case=FALSE)
relabeledMeanStdMeasurements<-gsub ("BodyBody", "Body", relabeledMeanStdMeasurements, ignore.case=FALSE)
relabeledMeanStdMeasurements<-gsub ("std", "StandardDeviation", relabeledMeanStdMeasurements, ignore.case=FALSE)
colnames(meanStdMeasurements)<-relabeledMeanStdMeasurements

##find the average of each variable for each subject and activity
averagesData<-meanStdMeasurements %>%
     ##remove the "type" column %>%
     select(-type) %>%
     group_by(subject, label) %>%
     ##find the average of each variable %>%
     summarize_each(funs(mean))

##output the new dataset as a file.
##this meets assignment requirement 5:
##"5.From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject."
write.table(averagesData, file="averagesData.txt", row.names=FALSE, col.names=TRUE)