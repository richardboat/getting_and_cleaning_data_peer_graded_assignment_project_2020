
##Getting and cleaning data in R. Project
#Now all these codes should be done in an R script called run_analysis.R 
#******************************************************************
#Step 0. Download and unzip the dataset
#******************************************************************
#i)
if(!file.exists("./data")){dir.create("./data")}

#These are the data for the project:
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/dataset.zip")

#ii)
# Unzip dataSet to my directory called data
unzip(zipfile="./data/dataset.zip",exdir="./data")


#******************************************************************
#Step 1.Merging the #training and the #test datasets to create a single data set.
#******************************************************************

# a) Reading files

# b)  Reading trainings data sets:

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# c) Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# d) Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# e) Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# f) Assigning column names:

colnames(x_train) <- features[,2]
colnames(y_train) <-"activeId"
colnames(subject_train) <- "subId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activeId"
colnames(subject_test) <- "subId"

colnames(activityLabels) <- c('activeId','activeType')

# g) Merging all data in one set:

merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
total_combined <- rbind(merge_train, merge_test)

#This yields a new dimension of 
#[1] 10299   563

#******************************************************************
#Step 2.-Extracts only the measurements on the mean and standard deviation for each measurement.
#******************************************************************

# a) Reading column names:

colNames <- colnames(total_combined)

# b) Create vector for defining ID, mean and standard deviation:

mean_std <- (grepl("activeId" , colNames) | 
                   grepl("subId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

# c) Making nessesary subset from setAllInOne:

mean_std_dta <- total_combined[ , mean_std == TRUE]

#******************************************************************
#Step 3. Using descriptive activity names to name the activities in the data set
#******************************************************************

set_activity_names <- merge(mean_std_dta, activityLabels,by='activeId',all.x=TRUE)

#******************************************************************
#Step 4. Appropriately labels the data set with descriptive variable names.
#******************************************************************

#completed in previous steps, see above!

#******************************************************************
#Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#******************************************************************

# a) Making a second tidy data set

tidy_data_set <- aggregate(. ~subId + activeId, set_activity_names, mean)
tidy_data_set <- tidy_data_set[order(tidy_data_set$subId, tidy_data_set$activeId),]

#looking at the 5 columns and rows, it looks tidy, yaaaaayyyyyy!!
tidy_data_set[1:5,1:5]


# b) Writing/saving the tidy  data set in txt file

write.table(tidy_data_set, "tidy_data_set.txt", row.name=FALSE)


