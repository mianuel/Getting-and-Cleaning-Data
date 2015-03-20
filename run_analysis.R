#################################################
# Project: from Getting and Cleaning Data Course
#################################################
# You should create one R script called run_analysis.R that does the following. 
# 1- Merges the training and the test sets to create one data set.
# 2- Extracts only the measurements on the mean and standard deviation for each
#   measurement. 
# 3- Uses descriptive activity names to name the activities in the data set
# 4- Appropriately labels the data set with descriptive variable names. 
# 5- From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.
#################################################
# Package data.table
if (!require("data.table")) {
	install.packages("data.table")
	require("data.table")
}

# Package reshape2
if (!require("reshape2")) {
	install.packages("reshape2")
	require("reshape2")
}

# Read all data coming from the training and testing set
print("Reading Data ...")
# Testing data
train_X <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Training data
test_X <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Other info from data
activity_Labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

print("Processing Project")
# Merge train and test data for X into a merged data frame for X
data_X <- rbind(train_X, test_X)
label_y <- rbind(train_y, test_y)
all_Subject <- rbind(train_subject, test_subject)
colnames(all_Subject) <- "Subjects"

# Rename all colunn of X data
colnames(data_X) <- as.character(features[,2])

# Get all Label
all_label <- merge(label_y, activity_Labels, by=1)[,2]

# Merge all col coming from all data
#   Appropriately labels the data set with descriptive variable names
#################################################
dataSet <- cbind(all_Subject, all_label, data_X)

# Save data in a text file.
#print("Writing first data set.")
#write.table(dataSet, file="data_set.txt")

# Extrat only the mean and std variables in a dataset.
data_MeanStd <- dataSet[,c(1, 2, grep("-mean()|-std()", colnames(dataSet)))]

# Mean calculation grouped by subject and label
print("Compute mean.")
meltedData = melt(data_MeanStd, id.var = c("Subjects", "all_label"))
data_Means = dcast(meltedData , Subjects + all_label ~ variable, mean)

# Save the resulting dataset
print("Writing tidy data set.")
#write.table(data_Means, file="tidy_data.txt", row.name <- FALSE)
write.table(data_Means, file="tidy_data.txt")

