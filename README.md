## Getting and Cleaning Data Course Project

### Project Requirements

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Steps to create the tidy data set

1. clone the repository: https://github.com/mihtam/GettingAndCleaningDataProject
2. download raw data from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. decompress raw data under a "UCI HAR Dataset" directory in the root of working directory
4. Open R console and set your working directory with setwd()
5. In R run script run_analysis.R from the root of your working directory with source('run_analysis.R')
6. In the root of the working directory the tidy data set avg_act_sub.txt will be created

### Repository content

- README.md - current file
- CodeBook.md - descriptions of the raw data set, tidy dataset and the transformation from raw data to tidy data set
- run_analysis.R - R script file with the steps from raw data to tidy data set
- avg_act_sub.txt - tidy data set obtained from the raw data set processed by running run_analysis.R script
