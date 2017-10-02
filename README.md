# Getting and Cleaning Data Course Project

## Project Files

- [run_analysis.R](run_analysis.R)  - The R script that performs the processing and creation of the tidy dataset.
- [activity_subject_averages.csv](activity_subject_averages.csv)  - This is the tidy dataset output by the script containing the averages for each activity and subject group.
- [codebook.md](codebook.md) - Codebook describing source data use and tidy dataset.

## Running the R script

1. Save [run_analysis.R](run_analysis.R) and change your R working directory to be the same one where the script resides.
2. Run the script by simply using `source('run_analysis.R')`. The output is then saved to the file `activity_subject_averages.csv`.

## Viewing the tidy dataset
```
tidydata <- read.csv('activity_subject_averages.csv')
View(tidydata)
```

## Description of approach

- The script will conditionally check for the file `dataset.zip` and, if not found, it will download it from
  [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  and unzip it into the current directory.
- It then follows the steps outlined in the project by doing the following:
    - Merges the training and test data for subjects, activities and data into a single `dataset` variable
    - Extracts only measurements for mean and standard deviations
    - Gives the remaining variables cleaner and more descriptive names
    - Creates a second dataset with the average of each variable for each activity and subject and stores it in
      a variable named `averagesByActivityAndSubject`.  This is then saved to the file `activity_subject_averages.csv`
- See the source of the script [run_analysis.R](run_analysis.R) for more detail.
