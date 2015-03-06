# getdate-011 quiz 1 
# https://class.coursera.org/getdata-011/quiz
# Due Date   Mon 9 Feb 2015 8:30 AM HKT

# setup work directory
setwd("C:/Users/zeng/workspace/getdata")
if(!file.exists("data"))
  { dir.create("data")}
# Question 1
function 
# download raw data and code book
url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
q1raw = "./data/ss06hid.csv"
download.file(url,q1raw)
url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
q1codebook ="./data/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(url,q1codebook)
