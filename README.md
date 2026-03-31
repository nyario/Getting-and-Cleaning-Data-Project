# Getting-and-Cleaning-Data-Project
# Getting and Cleaning Data Course Project

## Project description
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data used in this project come from the UCI Human Activity Recognition Using Smartphones Dataset.

## Files in this repository
- run_analysis.R – R script that performs the data cleaning
- tidy_data.txt – Final tidy dataset
- CodeBook.md – Description of variables and transformations
- README.md – This file

## How the script works
The script run_analysis.R performs the following steps:

1. Loads the training and test datasets.
2. Merges the training and the test sets into one dataset.
3. Extracts only the measurements on the mean() and standard deviation (std).
4. Uses descriptive activity names to name the activities.
5. Labels the dataset with descriptive variable names.
6. Creates a second tidy dataset with the average of each variable for each activity and each subject.
7. Writes the tidy dataset to a file called tidy_data.txt.

## How to run the script
1. Download and unzip the UCI HAR Dataset.
2. Place the folder "UCI HAR Dataset" in the working directory.
3. Open R or RStudio.
4. Run the script:
   ```r
   source("run_analysis.R")
