# Getting and Cleaning Data - Project
## Readme
This repository contains the files for the final project of "Getting and Cleaning data"
part of the Data Scientists Toolbox track on Coursera  It is designed to process the data available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Overview
As per the instructions of the project the script run_analysis.R does the following:  * Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The file run_analysis.R does not assume that the files required are already stored locally, if they are not they will be downloaded to a temporary file and extracted to your working directory.
