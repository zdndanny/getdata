---
title: "CodeBook - Getting and Cleaning Data Course Project"
author: "Danny Zeng"
date: "03/17/2015"
output: html_document
---

This is the codebook that describes the variables, the data, and any transformations or work that is performed to clean up the data.  

# The submitted Dataset

The data file is "courseproject.txt".  

To load this dataset in R for any further analysis
```
    data  <- read.table("courseproject.txt", header = TRUE)
```

# Variables

In the raw dataset, these signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
```
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```
For the project, I have extracted only two variables estimated from these signals: 
```
mean(): Mean value
std(): Standard deviation
```
As result, each row of the dataset is a summary of the specifitied group of (activity, subject), composed from average of all the variables. 

The columns in each row is listed and explained as below. 
```
"1" "activity"  -   the label of activity, the value can be one of: 
    "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", and
    "WALKING_UPSTAIRS" 
    
"2" "subject"   -   a number in range 1-30,  representing one of the subjects.
```
The rest of a row are the averages of the measurements on the mean and standard deviation for each measurement. 
```
"3" "tbodyacc_mean_x"
"4" "tbodyacc_mean_y"
"5" "tbodyacc_mean_z"
"6" "tbodyacc_std_x"
"7" "tbodyacc_std_y"
"8" "tbodyacc_std_z"
"9" "tgravityacc_mean_x"
"10" "tgravityacc_mean_y"
"11" "tgravityacc_mean_z"
"12" "tgravityacc_std_x"
"13" "tgravityacc_std_y"
"14" "tgravityacc_std_z"
"15" "tbodyaccjerk_mean_x"
"16" "tbodyaccjerk_mean_y"
"17" "tbodyaccjerk_mean_z"
"18" "tbodyaccjerk_std_x"
"19" "tbodyaccjerk_std_y"
"20" "tbodyaccjerk_std_z"
"21" "tbodygyro_mean_x"
"22" "tbodygyro_mean_y"
"23" "tbodygyro_mean_z"
"24" "tbodygyro_std_x"
"25" "tbodygyro_std_y"
"26" "tbodygyro_std_z"
"27" "tbodygyrojerk_mean_x"
"28" "tbodygyrojerk_mean_y"
"29" "tbodygyrojerk_mean_z"
"30" "tbodygyrojerk_std_x"
"31" "tbodygyrojerk_std_y"
"32" "tbodygyrojerk_std_z"
"33" "tbodyaccmag_mean"
"34" "tbodyaccmag_std"
"35" "tgravityaccmag_mean"
"36" "tgravityaccmag_std"
"37" "tbodyaccjerkmag_mean"
"38" "tbodyaccjerkmag_std"
"39" "tbodygyromag_mean"
"40" "tbodygyromag_std"
"41" "tbodygyrojerkmag_mean"
"42" "tbodygyrojerkmag_std"
"43" "fbodyacc_mean_x"
"44" "fbodyacc_mean_y"
"45" "fbodyacc_mean_z"
"46" "fbodyacc_std_x"
"47" "fbodyacc_std_y"
"48" "fbodyacc_std_z"
"49" "fbodyaccjerk_mean_x"
"50" "fbodyaccjerk_mean_y"
"51" "fbodyaccjerk_mean_z"
"52" "fbodyaccjerk_std_x"
"53" "fbodyaccjerk_std_y"
"54" "fbodyaccjerk_std_z"
"55" "fbodygyro_mean_x"
"56" "fbodygyro_mean_y"
"57" "fbodygyro_mean_z"
"58" "fbodygyro_std_x"
"59" "fbodygyro_std_y"
"60" "fbodygyro_std_z"
"61" "fbodyaccmag_mean"
"62" "fbodyaccmag_std"
"63" "fbodybodyaccjerkmag_mean"
"64" "fbodybodyaccjerkmag_std"
"65" "fbodybodygyromag_mean"
"66" "fbodybodygyromag_std"
"67" "fbodybodygyrojerkmag_mean"
"68" "fbodybodygyrojerkmag_std"
```


# Raw dataset and transformation

Following raw data files from the 'proj' directory are loaded for analysis. 

* 'proj/activity_labels.txt'
* 'proj/train//subject_train.txt'
* 'proj/train/y_train.txt'
* 'proj/train/X_train.txt'
* 'proj/test//subject_test.txt'
* 'proj/test/y_test.txt'
* 'proj/test/X_test.txt'

Please check 'README.md' for more details about the raw dataset.