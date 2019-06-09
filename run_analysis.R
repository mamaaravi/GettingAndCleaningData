##R Script for Final Project, "Getting and Cleaning Data"
##Before proceeding, please visit the accompanying "README.md" file and the "CodeBook.md" files on this
##same GitHub Repository



##Create a "data" folder in the working directory if one does not exist

if (!file.exists("data")) {
    dir.create("data")
}

##Check for the packages "reshape2" and "data.table" and install them if they are not currently loaded
##and them require them using the appropriate "require" command

if (!require("reshape2")) {
  install.packages("reshape2")
}

if (!require("data.table")) {
  install.packages("data.table")
}

require("reshape2")
require("data.table")

##Download zipped file from the internet and unzip it into the "data" folder using "unzip()"

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/final.zip")
unzip("./data/final.zip", exdir = "./data")

##Read "features" and "labels" data files

features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE, sep = "")[,2]
ext_features <- grep("mean|std", features)
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")[,2]

##Read "test" data files

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")
names(x_test) <- features
x_test <- x_test[,ext_features]
y_test[,2] <-activity_labels[y_test[,1]]
names(y_test) <- c("Activity_ID", "Activity_Label")
names(subject_test) <- "subject"


##Bind the data together

test_data <- cbind(as.data.table(subject_test), y_test, x_test)

##Read "train" data files

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")
names(x_train) <- features
x_train <- x_train[,ext_features]
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("Activity_ID", "Activity_Label")
names(subject_train) <- "subject"

##Bind the data together

train_data <- cbind(as.data.table(subject_train), y_train, x_train)

##Bind together the "test" and "train" data

allData <- rbind(test_data, train_data)

##Final labeling of data set

idLabels <- c("subject", "Activity_ID", "Activity_Label")
dataLabels <- setdiff(colnames(allData), idLabels)
finalData <- melt(allData, id = idLabels, measure.vars = dataLabels)

#Calculate means and write final data set

tidy_data <- dcast.data.table(finalData, subject~Activity_Label, fun = mean)

write.table(tidy_data, file = "./tidy_data.txt", row.name = FALSE)
