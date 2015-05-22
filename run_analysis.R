#Read the training data set CSV File
trainingDataSet = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
trainingDataSet[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
trainingDataSet[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

#Read the testing datasey CSV File
testingDataSet = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testingDataSet[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testingDataSet[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

#Read the Activity Labels
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Read features Dataset
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Merge the two datasets together
allData = rbind(trainingDataSet, testingDataSet)

# Get only Mean and Standard Deviation data
colsMeanStd <- grep(".*Mean.*|.*Std.*", features[,2])
features <- features[colsMeanStd,]
colsMeanStd <- c(colsMeanStd, 562, 563)
allData <- allData[,colsMeanStd]
colnames(allData) <- c(features$V2, "Activity", "Subject")
colnames(allData) <- tolower(colnames(allData))

##Loop
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  allData$activity <- gsub(currentActivity, currentActivityLabel, allData$activity)
  currentActivity <- currentActivity + 1
}

allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)

tidy = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t")