# Tidy Dataset Code Book

## Source Data Used

The source data used is automatically downloaded and extracted from:
- [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A single merged dataset is created from a combination of training and test measurement datasets provided within this
archive.  There are several files contained within, but those used complete the project are as follows:

- List of subjects from files:
    - `UCI HAR Dataset/train/subject_train.txt`
    - `UCI HAR Dataset/test/subject_test.txt`
    - These consist of integer subject identifiers ranging from 1-30
- List of activities from files:
    - `UCI HAR Dataset/train/y_train.txt`
    - `UCI HAR Dataset/test/y_test.txt`
    - These consist of integer activity identifiers ranging from 1-6
- Activity Names from the file:
    - `UCI HAR Dataset/activity_labels.txt`
- Measurement values from files:
    - `UCI HAR Dataset/train/X_train.txt`
    - `UCI HAR Dataset/test/X_test.txt`
    - These are made up of 561 numeric variables
- Measurement names
    - `UCI HAR Dataset/features.txt`
    - More info about these variables can be found in `UCI HAR Dataset/features_info.txt`

## Tidy Dataset

The tidy dataset [activity_subject_averages.csv](activity_subject_averages.csv) is created by first extracting only the measurements on the mean and standard deviation for each measurement from the merged dataset created from the source data above, and then averaging each variable for each activity and each subject.

<table>
<tr><th>Variable</th><th>Description</th></tr>
<tr>
    <td>
        subject
    </td>
    <td>
        Integer value ranging from 1-30 identifying the subject who performed activity        
    </td>
</tr>
<tr>
    <td valign="top">
        activity
    </td>
    <td>
        The activity performed.  One of the following six values:         
        <li>LAYING                                                                                 
        <li>SITTING
        <li>STANDING                                                                                 
        <li>WALKING                                                                                 
        <li>WALKING_DOWNSTAIRS                                                                                 
        <li>WALKING_UPSTAIRS                                                                                 
    </td>
</tr>
<tr>
    <td valign="top">
        3 through 81
    </td>
    <td>
        The remaining 79 variables are averages of all values for the given subject and activity
        <table>
            <tr><th>label</th><th>description</th></tr>
            <tr><td>time</td><td>signal from time related domain</td></tr>
            <tr><td>frequency</td><td>signal from frequency related domain</td></tr>
            <tr><td>acc</td><td>accelerometer signal</td></tr>
            <tr><td>gyro</td><td>gyroscope signal  </td></tr>
            <tr><td>x y and z</td><td>used to denote 3-axial signals in the X, Y and Z directions </td></tr>
            <tr><td>body</td><td>body related signal</td></tr>
            <tr><td>gravity</td><td>gravity related signal</td></tr>
            <tr><td>mag</td><td>magnitude calculated using Euclidean norm</td></tr>
            <tr><td>jerk</td><td>rate of change of acceleration</td></tr>
            <tr><td>mean</td><td>mean value</td></tr>
            <tr><td>stdev</td><td>standard deviation</td></tr>
        </table>
        <li> time.body.acc.x.mean
        <li> time.body.acc.y.mean
        <li> time.body.acc.z.mean
        <li> time.body.acc.x.stdev
        <li> time.body.acc.y.stdev
        <li> time.body.acc.z.stdev
        <li> time.gravity.acc.x.mean
        <li> time.gravity.acc.y.mean
        <li> time.gravity.acc.z.mean
        <li> time.gravity.acc.x.stdev
        <li> time.gravity.acc.y.stdev
        <li> time.gravity.acc.z.stdev
        <li> time.body.acc.jerk.x.mean
        <li> time.body.acc.jerk.y.mean
        <li> time.body.acc.jerk.z.mean
        <li> time.body.acc.jerk.x.stdev
        <li> time.body.acc.jerk.y.stdev
        <li> time.body.acc.jerk.z.stdev
        <li> time.body.gyro.x.mean
        <li> time.body.gyro.y.mean
        <li> time.body.gyro.z.mean
        <li> time.body.gyro.x.stdev
        <li> time.body.gyro.y.stdev
        <li> time.body.gyro.z.stdev
        <li> time.body.gyro.jerk.x.mean
        <li> time.body.gyro.jerk.y.mean
        <li> time.body.gyro.jerk.z.mean
        <li> time.body.gyro.jerk.x.stdev
        <li> time.body.gyro.jerk.y.stdev
        <li> time.body.gyro.jerk.z.stdev
        <li> time.body.acc.mag.mean
        <li> time.body.acc.mag.stdev
        <li> time.gravity.acc.mag.mean
        <li> time.gravity.acc.mag.stdev
        <li> time.body.acc.jerk.mag.mean
        <li> time.body.acc.jerk.mag.stdev
        <li> time.body.gyro.mag.mean
        <li> time.body.gyro.mag.stdev
        <li> time.body.gyro.jerk.mag.mean
        <li> time.body.gyro.jerk.mag.stdev
        <li> frequency.body.acc.x.mean
        <li> frequency.body.acc.y.mean
        <li> frequency.body.acc.z.mean
        <li> frequency.body.acc.x.stdev
        <li> frequency.body.acc.y.stdev
        <li> frequency.body.acc.z.stdev
        <li> frequency.body.acc.x.mean.frequency
        <li> frequency.body.acc.y.mean.frequency
        <li> frequency.body.acc.z.mean.frequency
        <li> frequency.body.acc.jerk.x.mean
        <li> frequency.body.acc.jerk.y.mean
        <li> frequency.body.acc.jerk.z.mean
        <li> frequency.body.acc.jerk.x.stdev
        <li> frequency.body.acc.jerk.y.stdev
        <li> frequency.body.acc.jerk.z.stdev
        <li> frequency.body.acc.jerk.x.mean.frequency
        <li> frequency.body.acc.jerk.y.mean.frequency
        <li> frequency.body.acc.jerk.z.mean.frequency
        <li> frequency.body.gyro.x.mean
        <li> frequency.body.gyro.y.mean
        <li> frequency.body.gyro.z.mean
        <li> frequency.body.gyro.x.stdev
        <li> frequency.body.gyro.y.stdev
        <li> frequency.body.gyro.z.stdev
        <li> frequency.body.gyro.x.mean.frequency
        <li> frequency.body.gyro.y.mean.frequency
        <li> frequency.body.gyro.z.mean.frequency
        <li> frequency.body.acc.mag.mean
        <li> frequency.body.acc.mag.stdev
        <li> frequency.body.acc.mag.mean.frequency
        <li> frequency.body.acc.jerk.mag.mean
        <li> frequency.body.acc.jerk.mag.stdev
        <li> frequency.body.acc.jerk.mag.mean.frequency
        <li> frequency.body.gyro.mag.mean
        <li> frequency.body.gyro.mag.stdev
        <li> frequency.body.gyro.mag.mean.frequency
        <li> frequency.body.gyro.jerk.mag.mean
        <li> frequency.body.gyro.jerk.mag.stdev
        <li> frequency.body.gyro.jerk.mag.mean.frequency        
    </td>
</tr>
</table>
