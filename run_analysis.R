#-----------------
# 0. Read raw data
#-----------------

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityId", "Activity"), stringsAsFactor=FALSE)

#-----------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
#-----------------------------------------------------------------

test_data_1 <- cbind(subject_test, y_test, test_data)
train_data_1 <- cbind(subject_train, y_train, train_data)
all_data <- rbind(test_data_1, train_data_1)

names(features) <- c("FeatureId", "FeatureName")
all_data_vars <- c("SubjectId", "ActivityId",features$FeatureName)
names(all_data) <- all_data_vars

#-------------------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#-------------------------------------------------------------------------------------------

select_vars <- grep("[M|m]ean|[S|s]td|SubjectId|ActivityId", all_data_vars)
select_data <- all_data[, select_vars]

#--------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
#--------------------------------------------------------------------------

select_data <- merge(select_data, activity_labels, by="ActivityId")
select_data$ActivityId <- NULL

#----------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names. 
#----------------------------------------------------------------------

select_vars <- names(select_data)

select_vars <- make.names(select_vars)
select_vars <- gsub("[.]+", ".", select_vars)

select_vars <- gsub("^t", "TimeDomain.", select_vars)
select_vars <- gsub("^f", "FrequencyDomain.", select_vars)
select_vars <- gsub("Acc", "Acceleration", select_vars)
select_vars <- gsub("Gyro", "AngularVelocity", select_vars)

names(select_data) <- select_vars

#-----------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.
#-----------------------------------------------------------------------------

library(plyr)
average_activity_subject = ddply(select_data, c("SubjectId","Activity"), numcolwise(mean))
write.table(average_activity_subject, "avg_act_sub.txt", row.name=FALSE)

