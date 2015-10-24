
##Parameters for the project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

 You should create one R script called run_analysis.R that does the following. 

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  ##Assumptions:
  The zip file above has already been extracted to your working directory, and that should be the UCI HAR Dataset folder.
  (note: discussed in https://class.coursera.org/getdata-033/forum/thread?thread_id=244) 
  
  
  ##Notes for the evaluator(s)
 * I put extensive comments in the run_analysis.R file. Probably more than one normally would for practical application, but as evaluators are all peer students, I felt it was important to ensure functionality was very clear.
 * There is discussion regarding step 3, regarding which columns are measurements on the mean and standard deviation. I chose to take any observation that had "mean" or "std" in the column name. Without knowing the intent of the initial measurements, I felt it was valuable to retain data rather than discard it, and the final result is still tidy data. 
  (See https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)
 * my variable names are camelCase, with the first letter being lowercase, and subsequent words in the variable name capitalized. This is the standard where I work, and I believe it is much more readable than long names in all lowercase.
    
  ##Deliverables:
  1. A tidy data set, that meets the principles of tidy data. 
	 Since a text file of a data table is sometimes hard to read, here's an easy way to read it into R:
	(thanks to https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/ for the code)
  
	data <- read.table("averagesData.txt", header = TRUE)
    View(data)
	
  2. run_analysis.R in the github repository.
  
  3. CodeBook.md markdown file that describes the variables, data and any transformations or work performed to clean up the data
  
  4. this ReadMe.md file
  
  ##License
  Per the license information in the Readme of the original data:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.