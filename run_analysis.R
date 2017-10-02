library(dplyr)

if (!file.exists('dataset.zip')) {
  download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', 'dataset.zip')
}
if (!file.exists('UCI HAR Dataset')) {
  unzip('dataset.zip')
}

#
# 1)  Merge the training and the test sets to create one data set.
#

# create combined data.frame for all training and test subject identifiers
subjectIds <- rbind(
  read.table('UCI HAR Dataset/train/subject_train.txt', col.names = c('subject')),
  read.table('UCI HAR Dataset/test/subject_test.txt', col.names = c('subject'))
)

# create combined data.frame for all training and test activity labels
activityLabels <- rbind(
  read.table('UCI HAR Dataset/train/y_train.txt', col.names = c('activity')),
  read.table('UCI HAR Dataset/test/y_test.txt', col.names = c('activity'))
)

# create combined data.frame for all training and test datasets
data <- rbind(
  read.table('UCI HAR Dataset/train/X_train.txt'),
  read.table('UCI HAR Dataset/test/X_test.txt')
)

# read and populate variable names for dataset
features <- read.table('UCI HAR Dataset/features.txt', col.names = c('column.index', 'name'))
names(data) <- features$name

# finally combine subjects, activities and datasets into one data set
dataset <- cbind(subjectIds, activityLabels, data)

#
# 2)  Extract only the measurements on the mean and standard deviation for each measurement
#

# grep the column indices containing means and standard deviations
meanAndStandardDeviationVariables <- grep('(std|mean)', names(dataset))

# take subset containing variables for subject, activity and the matched variables
dataset <- dataset[, c(1, 2, meanAndStandardDeviationVariables)]

#
# 3)  Use descriptive activity names to name the activities in the data set
#

# load the activity label names and replace the dataset's activity variable with the more descriptive value
activities <- read.table('UCI HAR Dataset/activity_labels.txt', col.names = c('label', 'name'))
dataset$activity <- activities$name[dataset$activity]

#
# 4)  Appropriately label the data set with descriptive variable names.
#
# The goal here was:
# - have more explicit and descriptive names.  
# - use all lowercase
# - use period "." in place of spaces
#

names(dataset) <- sub('^t', 'time.', names(dataset))
names(dataset) <- sub('^f', 'frequency.', names(dataset))
names(dataset) <- gsub('Body', 'body.', names(dataset))
names(dataset) <- sub('Gravity', 'gravity.', names(dataset))
names(dataset) <- sub('Acc', 'acc.', names(dataset))
names(dataset) <- sub('Jerk', 'jerk.', names(dataset))
names(dataset) <- sub('Gyro', 'gyro.', names(dataset))
names(dataset) <- sub('Mag', 'mag.', names(dataset))

names(dataset) <- sub('-mean\\(\\)-X', 'x.mean', names(dataset))
names(dataset) <- sub('-mean\\(\\)-Y', 'y.mean', names(dataset))
names(dataset) <- sub('-mean\\(\\)-Z', 'z.mean', names(dataset))
names(dataset) <- sub('-mean\\(\\)',   'mean',   names(dataset))

names(dataset) <- sub('-meanFreq\\(\\)-X', 'x.mean.frequency', names(dataset))
names(dataset) <- sub('-meanFreq\\(\\)-Y', 'y.mean.frequency', names(dataset))
names(dataset) <- sub('-meanFreq\\(\\)-Z', 'z.mean.frequency', names(dataset))
names(dataset) <- sub('-meanFreq\\(\\)',   'mean.frequency', names(dataset))

names(dataset) <- sub('-std\\(\\)-X', 'x.stdev', names(dataset))
names(dataset) <- sub('-std\\(\\)-Y', 'y.stdev', names(dataset))
names(dataset) <- sub('-std\\(\\)-Z', 'z.stdev', names(dataset))
names(dataset) <- sub('-std\\(\\)',   'stdev',   names(dataset))

names(dataset) <- sub('body.body',   'body',   names(dataset))

#
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each
#    variable for each activity and each subject.
#

averagesByActivityAndSubject <-
  dataset %>%
    group_by(subject, activity) %>%
      summarize_all(funs(mean))

write.table(averagesByActivityAndSubject, file='activity_subject_averages.csv', sep=',', row.names=FALSE)
