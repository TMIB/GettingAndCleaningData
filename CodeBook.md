

##Data:
Data for this project was taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Background
Per the original data Readme:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Feature Selection
The features for the initial data are detailed in the features_info.txt file  

##Codebook 
The following steps were taken on the initial data set to create the new tidy data set:

1) The subject, label, train, and test text files were read in as tables.  
2) the columns in the training and test data tables were renamed to match the feature names in the features.txt file  
3) "label" and "subject" column names were added to the label and subject tables  
4) The subject training table was combined with the subject training labels and the training session data  
5) The subject test table was combined with the subject test labels and the training test data  
6) Duplicate columns were removed from all tables  
7) A "type" column was added to indicate whether a table was a "train" table or a "test" table  
8) A new dataset was created by merging the training and test sets  
9) The measurements on the mean and standard deviation for each measurement were extracted.  
10) The data set activity names were renamed to be more descriptive, using the labels defined in activity_labels.txt  
11) The data set variables were renamed with descriptive names according to the following rules:  
	"tBody" was replaced with "TimeBody"  
	"tGravity" was replaced with "TimeGravity"  
	"Mag" was replaced with "Magnitude"  
	"Gyro" was replaced with "Gyroscope"  
	"Acc" was replaced with "Accelerometer"  
	"fBody" was replaced with "FastFourierTransformBody"  
	"Freq" was replaced with "Frequency"  
	"BodyBody" was replaced with "Body"  
	"std" was replaced with "StandardDeviation"  
	  
12) The average of each variable for each subject and activity was determined  
13) The averages were used to generate a tidy data text file (averagesData.txt) that meets the principles of tidy data. This is in a wide format, with 30 subjects across 6 activities. Each row is an observation and each column is a variable. There are no duplicate variables.

