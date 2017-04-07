## Load in required packages
packs <- c("tidyverse", "data.table")
sapply(packs, library, character.only = TRUE)

## Create data folder within working directory
### Checks whether data directory exists and if not will create one
filepath <- file.path(getwd(), "Data")
if(!file.exists(filepath)) {
        dir.create(filepath)
}

## Download to temporary directory and extract archive to Data folder
### Checks to see if required data exists in working directory, will download
### to a temporary folder and extract to wd if not
datapath <- file.path(filepath, "UCI HAR Dataset")
if(!file.exists(datapath)) {
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        temp <- tempdir()
        tempf <- tempfile(tmpdir = temp, fileext = ".zip")
        download.file(url, destfile = tempf)
        unzip(tempf, exdir = filepath) 
} else {
        print("file already exists")
}

## Read the subject files
sub_train <- fread(file.path(datapath, "train", "subject_train.txt"))
sub_test <- fread(file.path(datapath, "test", "subject_test.txt"))

## Read the activity files
act_train <- fread(file.path(datapath, "train", "y_train.txt"))
act_test <- fread(file.path(datapath, "test", "y_test.txt"))

## Read the data files
train <- read.table(file.path(datapath, "train/X_train.txt"))
test <- read.table(file.path(datapath, "test/X_test.txt"))

## Combine data into one data frame
tbl_subj <- rbind(sub_train, sub_test)
tbl_subj <- rename(tbl_subj, subject = V1)
tbl_actv <- rbind(act_train, act_test)
tbl_actv <- rename(tbl_actv, activitynumber = V1)
tbl_subject <- cbind(tbl_subj, tbl_actv) ### Result table of activity by subject
train_test <- rbind(train, test) ### Result table of all activity data
data <- cbind(tbl_subject, train_test) ### Combination of all data

## Extract only the data on the mean and standard deviation for each observation
featcols <- c("featurenumber", "featurename")
features <- fread(file.path(datapath, "features.txt"), col.names = featcols) ### Read in features file
relevant <- grep("mean\\(\\)|std\\(\\)", features$featurename) ### Extract relevant feature names
relevant <- paste0("V", relevant) ### Convert to column names in data
data <- select(data, subject, activitynumber, one_of(relevant)) ### Use to select relevant columns in data

## Label with descriptive activity names
acty_desc <- fread(file.path(datapath, "activity_labels.txt"), 
                   col.names = c("activitynumber", 
                   "activitydescription")) ### Read in descriptions
data <- full_join(data, acty_desc, by = "activitynumber") ### Join to dataset
data <- select(data, subject, activitydescription, one_of(relevant))

## Label descriptive variable names
vars <- names(data[grepl("^V", names(data))]) ### Extract feature variables from dataset
feature <- features %>%
        mutate(featurecode = paste0("V", featurenumber)) %>%
        filter(featurecode %in% vars) ### Adds code variable to features data and filters out unrequired rows

### Adjust feature names to be more descriptive
featurevect <- feature$featurename
featurevect <- gsub("^t", "time", featurevect)
featurevect <- gsub("^f", "frequency", featurevect)
featurevect <- gsub("Acc", "Accelerometer", featurevect)
featurevect <- gsub("Gyro", "Gyroscope", featurevect)
featurevect <- gsub("Mag", "Magnitude", featurevect)
featurevect <- gsub("BodyBody", "Body", featurevect)

### Assign new variable names to dataset
names <- c("subject", "activitydescription", featurevect)
data <- setNames(data, names)

## Create tidy dataset with variable averages for each activity and subject

data <- aggregate(. ~subject + activitydescription, data, mean)
data <- data[order(data$subject,data$activitydescription),]

## Export data to .txt file in working directory

write.table(data, file = "tidyoutput.txt",row.name=FALSE)
