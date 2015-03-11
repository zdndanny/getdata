# Getting and Cleaning Data Course Project
# 
# run_analysis.R 
# 
# 
# 1. Merges the training and the test sets to create one data set.

library("dplyr")

# Assuming the Samsung data is in your working directory.
# I have extract the data files into this directory. 

# setwd('~/workspace/getdata/courseproject/')
activities  <- read.table('activity_labels.txt')
features  <- read.table('features.txt')

subject_train  <- read.table('train//subject_train.txt')
y_train  <- read.table('train/y_train.txt')
X_train <- read.table('train/X_train.txt', colClasses = 'numeric')

subject_test  <- read.table('test//subject_test.txt')
y_test  <- read.table('test/y_test.txt')
X_test <- read.table('test/X_test.txt', colClasses = 'numeric')

X  <- rbind(X_train, X_test)
y  <- rbind(y_train, y_test)
subject  <-  rbind(subject_train, subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each
# measurement. 
colnames(X) <- features$V2
ff  <- grep("mean|std", features$V2)
xtidy  <- X[,ff]


# 3. Uses descriptive activity names to name the activities in the data set

##  FIXME - replace the "[-()]" characters in variable names with '.'

activities$V2 <- factor(activities$V2)
ytidy  <- merge(y, activities, by="V1") %>% select(V2)

# 4. Appropriately labels the data set with descriptive variable names. 
setnames(ytidy, old=1, new="activity")
colnames(subject) <- "subject"

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.


tidy  <-  
    # combine the activity, subject data to the variables, by column 
    # using the chain notation
    cbind(ytidy, subject, xtidy) %>% 
    
    # group for each activity and each subject
    group_by(activity, subject) %>%
    
    # average of each variable, the group_by variables (activity, subject) are 
    # excluded when we do summarise_each
    summarise_each(funs = funs(mean)) %>%
    print


# Please upload the tidy data set created in step 5 of the instructions. 
# Please upload your data set as a txt file created with write.table() using 
# row.name=FALSE 

write.table(tidy,"mytidydata.txt", row.names=FALSE)
# and list the variable nemes to the codebook file. 
codebook  <- names(tidy)
write.table(codebook,"CodeBook.md", col.names = "variables", row.names=TRUE)

