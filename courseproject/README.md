---
title: "README - Getting and Cleaning Data Course Project"
author: "Danny Zeng"
date: "03/17/2015"
output: html_document
---

## The dataset includes following files

* courseproject.txt    -   a tidy dataset as result of the assignment
* CodeBook.md       -   a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data
* run_analysis.R    -   a R script script for performing the analysis.
* README.md         -   this file  explains how all of the scripts work and how they are connected. 

These files are published at a Github repository: 


## Project Assignment

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

Good luck!

## Getting the original dataset 

* Download the data file from url above with a web browser, or a command line tool like wget, or curl
* Extract the zip file and keep the dirctory structure. 
* Rename the directory name for easier typing
{{{
unzip data/getdata_projectfiles_UCI\ HAR\ Dataset.zip 
mv UCI\ HAR\ Dataset/ proj
}}}


## What is in the raw dataset?

```
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
```

## The experiments

According to the 'README.txt' included in raw dataset, 

```
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
```

The 'README.txt' included in the dataset provides more information about the dataset.  
The 'features_info.txt' included in the dataset provides details of variables. 

## How the submitted script work

1. Save 'run_analysis.R' script in work directory;
2. Copy the raw data to 'input' directoryl;
3. Run in R
```{r}
    source('run_analysis.R')
```
3. The script will create the 'output' directory, and inside the 'courseproject.txt' dataset and 'codebook.txt' file.
4. The 'codebook.txt' file can be used to create the 'CodeBook.md'.

## Inside the srcipt it works as below

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* propriately labels the data set with descriptive variable names. 

Please read the R script comments for implementation related details.  





