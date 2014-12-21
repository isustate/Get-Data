## Program: run_analysis.R
## Description: Samsung Galaxy S accelerometer data aggregation. 
## Created: 12-21-2014
## Updated: 12-21-2014

library(plyr)

## Imports Activity Labels and Features
## Filters out Feauters to Mean, mean and std variables
filePath <- c("./activity_labels.txt")
activities <- read.table(filePath, header = FALSE)
colnames(activities) <- c("ActivityCode","Activity")

filePath <- c("./features.txt")
features <- read.table(filePath, sep=" ", header = FALSE)
foilist <- features[grep("mean|Mean|std",as.vector(features[,'V2'])),'V2']
foi <- c(foilist)

## Imports acceleometer data from training subjects: x_train, y_train, & subject_train
## Filters out dataframe to include only measurements of Mean, mean and std
filePath <- c("./train/x_train.txt")
trainx <- read.table(filePath, header = FALSE)
trainxcolnames  <- as.vector(features[,2])
colnames(trainx) <- trainxcolnames
TrainActivityData <- trainx[,foi]

filePath <- c("./train/y_train.txt")
trainy <- read.table(filePath, header = FALSE)
colnames(trainy) <- c("ActivityCode")

filePath <- c("./train/subject_train.txt")
trainsub <- read.table(filePath, header = FALSE)
colnames(trainsub) <- c("Subject")

Activity <- activities[match(trainy$ActivityCode, activities$ActivityCode),'Activity']
TrainActivitySubjectData <- cbind(trainsub, Activity, TrainActivityData)

## Imports acceleometer data from test subjects: x_train, y_train, & subject_train
## Filters out dataframe to include only measurements of Mean, mean and std
filePath <- c("./test/x_test.txt")
testx <- read.table(filePath, header = FALSE)
testxcolnames  <- as.vector(features[,2])
colnames(testx) <- testxcolnames
testActivityData <- testx[,foi]

filePath <- c("./test/y_test.txt")
testy <- read.table(filePath, header = FALSE)
colnames(testy) <- c("ActivityCode")

filePath <- c("./test/subject_test.txt")
testsub <- read.table(filePath, header = FALSE)
colnames(testsub) <- c("Subject")

Activity <- activities[match(testy$ActivityCode, activities$ActivityCode),'Activity']
testActivitySubjectData <- cbind(testsub, Activity, testActivityData)

## Combines training and test data into a tidy dataframe, ActivitySubjectData, which is means
## of all measurements.  Outputs table into file called: SubjectActivityMeans.txt.  
ActivitySubjectData <- rbind(testActivitySubjectData, TrainActivitySubjectData)
ActivityMean <- aggregate(ActivitySubjectData[,3:88],by=list(ActivitySubjectData$Subject,ActivitySubjectData$Activity), mean)
colnames(ActivityMean)[1:2] <- c("Subject","Activity")
write.table(ActivityMean, "./SubjectActivityMeans.txt",row.names=FALSE)
