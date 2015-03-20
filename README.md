# Coursera course: Getting and Cleaning Data

## Main Goal of the project
The goal of the R script **run_analysis.R** is to prepare tidy data from the accelerometers of the Samsung Galaxy S smartphone and save them to a text file call *tidy_data.txt*. The data collected from the accelerometers is reading from a text file. For the purpose of the course the data can be retreive at this web adress: [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## How to execute
R should installed in your computer. You can download R [here](). You should execute run_analysis.R in the same directory where you have uncrompress data from the accelerometers (where the folder *UCI HAR Dataset* exist).
> R run_analysis.R

## Transfromation perform by run_analysis.R

 The R script called run_analysis.R does the following. 

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Output Data
All tidy data are ouput in a test file: *tidy_data.txt*

## More information
More information can be obtain in the file CoodeBook.md

Thank you for reading this file.