# Week 4 Quiz
# Question 1
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
# and load the data into R. The code book, describing the variable names is here: 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
# Apply strsplit() to split all the names of the data frame on the characters 
# "wgtp". What is the value of the 123 element of the resulting list?

source("./dl.R")

dataf  <- "./data/quiz4.1.csv"
codebook  <- "./data/quiz4.1codebook.pdf"
data_dl  <- dl(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
  dataf)
codebook_dl <- dl(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf",
  codebook)
data_dl
codebook_dl

df  <- read.csv(dataf)
head(df)
namesplit  <- strsplit(names(df), "wgtp")
namesplit[[123]]
# [1] ""   "15"


# Question 2
# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? 

# Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table
quiz2.data  <- "quiz4.2.csv"
quiz2.downloaded  <- dl(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
  quiz2.data)                      
df  <-  read.csv(quiz2.data, colClasses = "character")
# str_replace_all {stringr}  R Documentation
# Replace all occurrences of a matched pattern in a string.

# Description

# Vectorised over string, pattern and replacement. Shorter arguments will be expanded to length of longest.

# Usage

# str_replace_all(string, pattern, replacement)
library("stringr")
ranking  <- as.numeric(df$Gross.domestic.product.2012)
gdp  <- str_replace_all(df$X.3[!is.na(ranking)], ",", "")
gdp  <- as.numeric(gdp)
mean(gdp)
#
#> mean(gdp)
# [1] 377652.4

# Question 3
# In the data set from Question 2 what is a regular expression that would allow
# you to count the number of countries whose name begins with "United"? 
# Assume that the variable with the country names in it is named countryNames. 
# How many countries begin with United?
countryNames  <- df$X.2[!is.na(ranking)]
m <- countryNames[grep("^United", countryNames)]
m
length(m)

#> m
#[1] "United States"        "United Kingdom"       "United Arab Emirates"
#> length(m)
#[1] 3

# Question 4
# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

# Load the educational data from this data set: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

# Match the data based on the country shortcode. 
# Of the countries for which the end of the fiscal year is available, how many end in June? 
quiz4.4edu  <- "quiz4.4.csv"
dl("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", quiz4.4edu)
df4  <- read.csv(quiz4.4edu, colClasses = "character")
fyavail  <- grep("Fiscal year end", df4$Special.Notes)
fy_end_june  <- grep("end: June", df4$Special.Notes[fyavail])
str(fy_end_june)
#  int [1:13] 2 3 4 6 8 14 15 22 23 25 ...

# Question 5
# You can use the quantmod (http://www.quantmod.com/) package to get historical
# stock prices for publicly traded companies on the NASDAQ and NYSE. 
# Use the following code to download data on Amazon's stock price and get the times the data was sampled.

# install.packages('quantmod')
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

# How many values were collected in 2012? How many values were collected on Mondays in 2012?
y2012  <- grep("^2012", sampleTimes)
length(y2012)
# > length(y2012)
# [1] 250

d2012  <- as.Date(sampleTimes[y2012])
mon2012  <- grep("Monday",weekdays(d2012))
str(mon2012)
# int [1:47] 5 14 19 24 29 38 43 48 53 58 ...