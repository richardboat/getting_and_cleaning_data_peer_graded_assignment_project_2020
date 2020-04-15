# getting_and_cleaning_data_peer_graded_assignment_project_2020
This is a project on  getting and cleaning data. It requires the combination of knowledge of github, git and R. 

##Getting and Cleaning Data - peer assessment project--April/15/2020

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#In the run_analysis.R script, the following steps were utilized.

This file 'run_analysis.R' contains all the code to perform the analyses described in the 5 steps. You can run the codes in R-studio.

**About this R script**

File with R code "run_analysis.R" and the code book contains the codes to implement the project's requirents:

1) Merging the training and the test sets to create one data set.
a) Reading files
b) Reading trainings tables
d) Reading testing tables
e) Reading feature vector
f) Reading activity labels
g) Assigning column names
h) Merging all data in one set

2) Extracting only the measurements on the mean and standard deviation for each measurement

a) Reading column names
b) Create vector for defining ID, mean and standard deviation
c) Making nessesary subset from setAllInOne

3) Using descriptive activity names to name the activities in the data set

4) Appropriately labeling the data set with descriptive variable names

5) Creating a second, independent tidy data set with the average of each variable for each activity and each subject

a) Making second tidy data set
b) Writing second tidy data set in txt file


