Getting and Cleaning data - week 4 assignment
C. Jackson - 10/14/18

Raw data for this assignment used by permission: 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


The observations for the experiment were gathered from a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 561 measurement values 
were recorded by the phone. 

Objective of this assignment: To take all experiment observations from the above source, find the values that represent the mean and standard deviation of all possible variables, and average all of these values by Participant and Activity. 

The following files from the Human Activity Recognition project were used to fulfill the objective:

X_train.txt         training measurements

X_test.txt          test measurements

subject_train.txt   subject number for each measurement in X_train.txt (numeric 1 to 30)

subject_test.txt    subject number for each measurement in X_test.txt  (numeric 1 to 30)

y_train.txt         activity number for each measurement in X_train.txt (numeric 1 to 6)

y_test.txt          activity number for each measurement in X_test.txt  (numeric 1 to 6)

features.txt        the headings for each set of measurements found in both X_train.txt and X_test.txt  (character values)

activity_labels.txt the names of each activity listed above  (character values)


Files created are for this repo:
README.txt     - This file

fullobs.txt    - tidy data set; full list of the mean and standard deviation measurements by Activity and Subject

avgobs.txt     - tidy data set; the average of the mean and standard deviation measurements by Activity and Subject found in fullobs.txt; this was the FINAL data set which the assignment expected. # of Columns = 68, # of Rows = 180

Codebook.md    - Codebook for this assignment explaining all variables in the txt files

run_analysis. R - The R code which created the fullobs.txt and avgobs.txt files

Instruction list that processed the raw data can be found in-line documentation within the run_analysis.R file, using R V3.5.1

