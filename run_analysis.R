#C. Jackson Data Science course 3 assignment - Getting and Cleaning Data
#
# This assignment uses files from the following:
#Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
#This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
#Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
#
# Pull in the raw zip file and unzip it
destfile<-"C:/Users/wacja/Documents/Dataset.zip"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile, mode="wb")
unzip("C:/Users/wacja/Documents/Dataset.zip", list=TRUE )

unzip("C:/Users/wacja/Documents/Dataset.zip")

# Read the train and test measurement data sets
fulltrain<-read.table(paste(getwd(),"/train/x_train.txt", sep=""))
fulltest<-read.table(paste(getwd(),"/test/x_test.txt", sep=""))

# Read the subject files, containing the subject for each measurements found in train and test files
subj_train <- read.table(paste(getwd(), "/train/subject_train.txt", sep=""))
subj_test <- read.table(paste(getwd(), "/test/subject_test.txt", sep=""))

# Read the activity files, containing activity number for each measurement found in train and test files
lbltrain <- read.table(paste(getwd(), "/train/y_train.txt", sep=""))
lbltest <- read.table(paste(getwd(), "/test/y_test.txt", sep=""))

#Read in the column names for the measurements and activity labels of each activity
allttl<-read.table(paste(getwd(),"/features.txt", sep=""))
activ <- read.table(paste(getwd(), "/activity_labels.txt", sep=""))

#Pull out mean and std dev titles from each full file - these are the values which the assignment expects
partl <- allttl[grep("std()|mean()[^Freq]", allttl$V2), ]

#Pull out all columns from the training and test set that match the titles from partl
for (i in 1:nrow(partl)) {
  if (i==1) {
    newtrain <- fulltrain[[partl[i,1]]]
    newtest<-fulltest[[partl[i,1]]]
  }
  else  {
    newtrain <- cbind(newtrain, fulltrain[[partl[i,1]]])
    newtest <- cbind(newtest, fulltest[[partl[i,1]]])
  }
}
#Clean up memory
remove("fulltrain","fulltest")

# Name the columns in both files, using original titles
colnames(newtrain) <- as.character(partl[,2])
colnames(newtest) <- as.character(partl[,2])

# Append new columns from subject and activity files, and name the new columns
newtrain <- cbind(newtrain, subj_train)
names(newtrain)[67] <- "Subject"
newtrain <- cbind(newtrain, lbltrain)

newtest <- cbind(newtest, subj_test)
names(newtest)[67] <- "Subject"
newtest <- cbind(newtest, lbltest)

# Append both train and test files together
bothfl <- rbind(newtrain, newtest)

# Merge activity names with the activity name in bothfl$V1 by activity number
fullobs <- merge(bothfl, activ, by = "V1")
fullobs$V1 <- NULL
names(fullobs)[68] <- "Activity"

# Save completed file
write.table(fullobs,file="fullobs.txt", row.names = FALSE)

# Now create new tidy data set 
# install reshape 2 package to use melt!
install.packages("reshape2")
library(reshape2)
# Create skinny list of measurements by Activity and Subject
meltobs <- melt(fullobs, id=c("Activity","Subject"), measure.vars=as.character(partl[,2]))

# Create average of each Activity/Subject pair
avgobs <- dcast(meltobs, Activity + Subject ~ as.character(partl[,2]), mean)

# Save new file of means by Activity and by Subject
write.table(avgobs, file="avgobs.txt", row.names = FALSE)
