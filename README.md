# Getting and Cleaning Data - Project
## Readme
This repository contains the files for the final project of "Getting and Cleaning data"
part of the Data Scientists Toolbox track on Coursera.

## Overview
```run_analysis.R``` is designed to transform and tidy data available from the 
[UCI machine learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The data is a result of a study of 30 subjects aged 19-48 carrying out six activities whilst wearing a waist mounted smartphone with embedded inertial sensors.  The original dataset is available [here](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/)

As per the instructions of the project the script ```run_analysis.R``` does the following:

> 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The file ```run_analysis.R``` does not assume that the files required are already stored locally, if they are not they will be downloaded to a temporary file and extracted to your working directory.

## The output
The output dataset from ```run_analysis.R``` contains 180 observations and 68 variables.  There are six observations per subject, one for each activity. Variables one and two ('subject' and 'activitydescription' respectivly) are for the person observed and each of the six activities they undertook.  Each variable name summarises the data that it represents.  The summary data provided in the ```tidyoutput.txt``` includes summary averages for all the variables concerned with either the mean or standard deviation in the original data.  All averages are calculated using the function ```mean()``` and are not rounded.  Data has been summarised to show the average value for each variable per subject/activity.

## Additional information
I would recommend using the code `View(read.table("tidyoutput.txt", header = TRUE))` to view the contents of ```tidyoutput.txt```  
Further details on the output of the script can be found in codebook.md.  

