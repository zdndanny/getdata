# Getting and Cleaning Data Course Project
# 
# run_analysis.R 
# 
# 

library("dplyr")

setwd('~/workspace/getdata/courseproject')
# The raw data is expected in a directory named 'input'
# We will write to directory 'output'

if(!file.exists('input/README.txt')) stop("input directroy not found")
if(!file.exists('output')) dir.create("output")

# Loading raw data

activities  <- read.table('input/activity_labels.txt')
features  <- read.table('input/features.txt')

subject_train  <- read.table('input/train//subject_train.txt')
y_train  <- read.table('input/train/y_train.txt')
X_train <- read.table('input/train/X_train.txt', colClasses = 'numeric')

subject_test  <- read.table('input/test//subject_test.txt')
y_test  <- read.table('input/test/y_test.txt')
X_test <- read.table('input/test/X_test.txt', colClasses = 'numeric')

# 1. Merges the training and the test sets to create one data set.

subject  <-  rbind(subject_train, subject_test)
X  <- rbind(X_train, X_test)
y  <- rbind(y_train, y_test)

# 
# Lookup the features.txt for variable descriptions
# 
#   there is duplications in X variables 

# table(features$V2)
# ...
# angle(Z,gravityMean)          fBodyAcc-bandsEnergy()-1,16          fBodyAcc-bandsEnergy()-1,24 
# 1                                    3                                    3 
# fBodyAcc-bandsEnergy()-17,24         fBodyAcc-bandsEnergy()-17,32           fBodyAcc-bandsEnergy()-1,8 
# 3                                    3                                    3 
# fBodyAcc-bandsEnergy()-25,32         fBodyAcc-bandsEnergy()-25,48         fBodyAcc-bandsEnergy()-33,40 
# 3                                    3                                    3 
# fBodyAcc-bandsEnergy()-33,48         fBodyAcc-bandsEnergy()-41,48         fBodyAcc-bandsEnergy()-49,56 
# 3                                    3                                    3 
# fBodyAcc-bandsEnergy()-49,64         fBodyAcc-bandsEnergy()-57,64          fBodyAcc-bandsEnergy()-9,16 
# 3                                    3                                    3 
# ...

# 2. Extracts only the measurements on the mean and standard deviation for each
# measurement. 

s <- features[grep("-mean[^F]|-std", features$V2),]
# fortunately, duplication is not of this selection
# ...

xtidy  <- X[,s$V1] 

# 3. Uses descriptive activity names to name the activities in the data set

activities$V2 <- factor(activities$V2)
ytidy  <- merge(y, activities, by="V1") %>% select(V2)


# 4. Appropriately labels the data set with descriptive variable names. 
# make var names all lower case, 
s$V2  <- tolower(s$V2) 
# replace any "," or "-" characters in names with '.', and 
s$V2  <- gsub("[-,]", "_", s$V2)
# remove any of "()" characters from names
s$V2  <- gsub("[()]", "", s$V2)

colnames(xtidy)  <- s$V2
colnames(subject) <- "subject"
colnames(ytidy)  <- "activity"

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

tidy  <-  
    # combine the activity, subject data to the variables, by column 
    # using the chain notation
    cbind(ytidy, subject, xtidy) %>% 
    
    # group by each activity and each subject
    group_by(activity, subject) %>%
    
    # average of each variable, the group_by variables (activity, subject) are 
    # excluded when we do summarise_each
    summarise_each(funs = funs(mean)) %>%
    print


# Please upload the tidy data set created in step 5 of the instructions. 
# Please upload your data set as a txt file created with write.table() using 
# row.name=FALSE 

write.table(tidy, "output/courseproject.txt", row.names=FALSE)

# To verify the result
# tidy2  <- read.table("output/courseproject.txt", header = TRUE)

# and list the variable nemes to 'codebook.txt' file. 
write.table(names(tidy),"output/codebook.txt", col.names = "Variable_name", row.names=TRUE)

