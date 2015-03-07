# getdate-012 Week 1 quiz 
# https://class.coursera.org/getdata-011/quiz
# The due date for this quiz is Mon 9 Mar 2015 7:30 AM HKT.

# setup work directory
# setwd("C:/Users/zeng/workspace/getdata")
setwd("/home/danny/workspace/getdata")
if(!file.exists("data"))
  { dir.create("data")}
# Question 1
function 
# download raw data and code book
url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
q1raw = "./data/ss06hid.csv"
download.file(url,q1raw, method = 'curl')

url='https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf'
q1codebook ="./data/FPUMSDataDict06.pdf"
download.file(url,q1codebook, method = 'wget')
# internal method does not support https url
q1data <- read.csv(q1raw)
# How many properties are worth $1,000,000 or more? 
# from the cookbook
# VAL 2
# Property value
# bb .N/A (GQ/rental unit/vacant, not for sale only)
# 01 .Less than $ 10000
# 02 .$ 10000 - $ 14999
# 03 .$ 15000 - $ 19999
# 04 .$ 20000 - $ 24999
# 05 .$ 25000 - $ 29999
# 06 .$ 30000 - $ 34999
# 07 .$ 35000 - $ 39999
# 08 .$ 40000 - $ 49999
# 09 .$ 50000 - $ 59999
# 10 .$ 60000 - $ 69999
# 11 .$ 70000 - $ 79999
# 12 .$ 80000 - $ 89999
# 13 .$ 90000 - $ 99999
# 14 .$100000 - $124999
# 15 .$125000 - $149999
# 16 .$150000 - $174999
# 17 .$175000 - $199999
# 18 .$200000 - $249999
# 19 .$250000 - $299999
# 20 .$300000 - $399999
# 21 .$400000 - $499999
# 22 .$500000 - $749999
# 23 .$750000 - $999999
# 24 .$1000000+

sum(q1data$VAL == '24', na.rm = TRUE)
[1] 53
# question 2
# Use the data you loaded from Question 1. Consider the variable FES in the code book. 
# Which of the "tidy data" principles does this variable violate? 
# Each tidy data table contains information about only one type of observation.
# Tidy data has one observation per row.
# Numeric values in tidy data can not represent categories.
# Tidy data has one variable per column. <<== 

# FES 1
# Family type and employment status
# b .N/A (GQ/vacant/not a famil

# Question 3
# Download the Excel spreadsheet on Natural Gas Aquisition Program here:
#     
source("./dl.R")

url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
q3file  <- 'data/DATA.gov_NGAP.xlsx'
dl(url, q3file)
# 
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
#     
library('xlsx')
dat  <-  read.xlsx(q3file, 1, rowIndex = 18:23, colIndex = 7:15)
# 
# What is the value of:
#     
     sum(dat$Zip*dat$Ext,na.rm=T) 
# [1] 36534720

# Question 4
# Read the XML data on Baltimore restaurants from here:
#     
url4  <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
file4  <- 'data/restaurants.xml'
dl(url4, file4)
# 
# How many restaurants have zipcode 21231? 
library('XML')
doc  <- xmlParse(file4)
xmlName(xmlRoot(doc))
zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zip == "21231")
# [1] 127
free(doc)

# Question 5
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#     
url5  <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
file5  <- 'ss06pid.csv'
dl(url5,file5)
# 
# using the fread() command load the data into an R object
# 
# DT 
# 
# Which of the following is the fastest way to calculate the average value of the variable
# 
# pwgtp15 
# 
# broken down by sex using the data.table package? 
# DT[,mean(pwgtp15),by=SEX]
# tapply(DT$pwgtp15,DT$SEX,mean)
# rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
# mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
# sapply(split(DT$pwgtp15,DT$SEX),mean)
# mean(DT$pwgtp15,by=DT$SEX)

library("data.table")  


DT  <- fread(file5)

DT[,mean(pwgtp15),by=SEX]
system.time(DT[,mean(pwgtp15),by=SEX])
# SEX       V1
# 1:   1 99.80667
# 2:   2 96.66534
# 
# 用户  系统  流逝 
# 0.003 0.000 0.003 

tapply(DT$pwgtp15,DT$SEX,mean)
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
# 1        2 
# 99.80667 96.66534 
# 
# 用户  系统  流逝 
# 0.003 0.000 0.003 

mean(DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15)
system.time(mean(DT[DT$SEX==1,]$pwgtp15))
system.time(mean(DT[DT$SEX==2,]$pwgtp15))
# [1] 99.80667
# [1] 96.66534
# > system.time(mean(DT[DT$SEX==1,]$pwgtp15))
# 用户  系统  流逝 
# 0.039 0.000 0.040 
# > system.time(mean(DT[DT$SEX==2,]$pwgtp15))
# 用户  系统  流逝 
# 0.035 0.000 0.037 

sapply(split(DT$pwgtp15,DT$SEX),mean)
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
# 1        2 
# 99.80667 96.66534 
# 用户  系统  流逝 
# 0.002 0.000 0.002
# faster but not using DT

mean(DT$pwgtp15,by=DT$SEX)
system.time(mean(DT$pwgtp15,by=DT$SEX))
# [1] 98.21613  !! Wrong answer
# 用户  系统  流逝 
# 0.000 0.000 0.001 


