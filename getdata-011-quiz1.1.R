# getdate-011 quiz 1 
# https://class.coursera.org/getdata-011/quiz
# Due Date   Mon 9 Feb 2015 8:30 AM HKT

# setup work directory
setwd("C:/Users/zeng/workspace/getdata")
data.dir <- "./data"

newdir <- function(dirname) {
  if(!file.exists(dirname))
   dir.create(dirname)
}

newdir(data.dir)

# Question 1
q1_1-download  <- function() {
  # download raw data and code book
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  q1_1raw  <-  "./data/ss06hid.csv"
  if(!file.exists(q1_1raw)) download.file(url,q1raw)
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
  q1_1codebook  <- "./data/getdata%2Fdata%2FPUMSDataDict06.pdf"
  if(!file.exists(q1_1codebook)) download.file(url,q1_1codebook)
  
  DateDownloaded  <- date()
  DateDownloaded
  list.files(data.dir)
}
q1-1  <- function(){
# How many properties are worth $1,000,000 or more?   
# in code book, look up Property value
#   VAL 2
#  Property value
#  24 .$1000000+
  sum(q1_1data$VAL=="24", na.rm = T)
#  [1] 53
}

