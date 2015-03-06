# Question 5
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
file  <- "data/getdata_data_ss06pid.csv"
if(!file.exists(file)) {download.file(url, destfile = file)}
dateDownloaded  <- date()
file
dateDownloaded

# using the data.table package? 
library("data.table")  

# using the fread() command load the data into an R object DT

# Which of the following is the fastest way to calculate the average value of the variable
# pwgtp15 #broken down by sex 

DT  <- fread(file) 
DT[,mean(pwgtp15),by=SEX]
