Getting and Cleaning data - week 4 assignment
C. jackson - 10/14/18

Raw data for this assignment used by permission: 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


The observations were gathered from a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 561 measurement values 
were recorded by the phone. 

Files created are:
README.txt     - This file

fullobs.txt    - tidy data set; full list of the mean and standard deviation measurements by Activity and Subject

avgobs.txt     - tidy data set; the average of the mean and standard deviation measurements by Activity and Subject found in fullobs.txt

Codebook.md    - Codebook for this assignment

run_analysis. R - The R code which created the fullobs.txt and avgobs.txt files

Instruction list can be found in-line documentation within the run_analysis.R file




The fullobs.txt and avgobs.txt were created using the following from the Human Activity Recognition project:
Of the 561 measurements, 66 were extracted and combined from the following files:
X_train.txt         training measurements

X_test.txt          test measurements

subject_train.txt   subject number for each measurement in X_train.txt (numeric 1 to 30)

subject_test.txt    subject number for each measurement in X_test.txt  (numeric 1 to 30)

y_train.txt         activity number for each measurement in X_train.txt (numeric 1 to 6)

y_test.txt          activity number for each measurement in X_test.txt  (numeric 1 to 6)

features.txt        the headings for each set of measurements found in both X_train.txt and X_test.txt  (character values)

activity_labels.txt the names of each activity listed above  (character values)




