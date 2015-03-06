# question 3
# ownload the Excel spreadsheet on Natural Gas Aquisition Program here:
library(xlsx)  
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
file  <- "data/getdata_data_DATA.gov_NGAP.xlsx"
if(!file.exists(file)) {download.file(url, destfile = file)}
dateDownloaded  <- date()

# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called: dat
rows  <- 18:23
cols  <-7:15
dat  <- read.xlsx(file, sheetIndex = 1, rowIndex = rows, colIndex = cols)

sum(dat$Zip*dat$Ext, na.rm = T)
