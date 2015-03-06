# Week 3 Quiz 
# Question 1
# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# and load the data into R. The code book, describing the variable names is here:
#    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# Create a logical vector that identifies the households on greater than 10 acres who sold more than
# $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. 
# Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. 
# which(agricultureLogical) What are the first 3 values that result?

url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
h <- read.csv(url1)

# from the codebook, 
# ACR 1
# Lot size
# b .N/A (GQ/not a one-family house or mobile home)
# 1 .House on less than one acre
# 2 .House on one to less than ten acres
# 3 .House on ten or more acres  <<==
# AGS 1
# Sales of Agriculture Products
# b .N/A (less than 1 acre/GQ/vacant/
#           .2 or more units in structure)
# 1 .None
# 2 .$ 1 - $ 999
# 3 .$ 1000 - $ 2499
# 4 .$ 2500 - $ 4999
# 5 .$ 5000 - $ 9999
# 6 .$10000+  <<==

str(h$ACR)

agricultureLogical  <- (h$ACR == 3) & (h$AGS == 6)
which(agricultureLogical)
# answer Question 1 
#  [1]  125  238  262  470  555  568  608  643  787  808  824  849  952  955 1033 1265 1275

# Question 2
# Using the jpeg package read in the following picture of your instructor into R
#   https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
# Use the parameter native=TRUE. 
# What are the 30th and 80th quantiles of the resulting data? 
# (some Linux systems may produce an answer 638 different for the 30th quantile)
library(jpeg)
url2  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
pic_file <- "data/getdata_jeff.jpg"
if (!file.exists(pic_file)) {
  download.file(url2, pic_file)
}

pic <- readJPEG(pic_file, native = TRUE)
quantile(pic, c(0.3, 0.8))
#       30%       80% 
# -15259150 -10575416 


# Question 3
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
  
url31  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

# Load the educational data from this data set:
  
url32 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

# Match the data based on the country shortcode. How many of the IDs match? 
# Sort the data frame in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame?

# Original data sources:
#  http://data.worldbank.org/data-catalog/GDP-ranking-table
#  http://data.worldbank.org/data-catalog/ed-stats 

library(dplyr)

gdp <- read.csv(url31, colClasses = "character")
View(gdp)
edu  <- read.csv(url32)
View(edu)

# this data is messy, let's first clean up

gdp_clean  <- gdp %>%
  filter(X!="") %>%
  filter(Gross.domestic.product.2012!="")  %>%
  mutate(rank = as.numeric(Gross.domestic.product.2012))  %>%
  arrange(desc(rank)) %>%
  print

m  <- gdp_clean$X %in% edu$CountryCode
#  Answer Question 3
sum(m)
# [1] 189
gdp_clean$X.2[13]
# [1] "St. Kitts and Nevis"

# Question 4
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group? 
m4  <- merge(gdp_clean, edu, by.x = "X", by.y="CountryCode")
m4 %>%
  select(X, Short.Name, rank, Income.Group) %>%
  group_by(Income.Group) %>%
  summarise(mean(rank)) %>%
  print
#
# Source: local data frame [5 x 2]

# Income.Group mean(rank)
# 1 High income: nonOECD   91.91304
# 2    High income: OECD   32.96667
# 3           Low income  133.72973
# 4  Lower middle income  107.70370
# 5  Upper middle income   92.13333

# Question 5
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 
# How many countries are Lower middle income but among the 38 nations with highest GDP?

m5  <- merge(gdp_clean, edu, by.x = "X", by.y="CountryCode")
q  <-  quantile(m5$rank, c(0,1,2,3,4,5)/5)
by_quant <- cut(m5$rank, q)
m5  <- m5 %>%
  mutate(rank_q5 = cut(rank, q)) %>%
  group_by(rank_q5) %>%
  print

table(m5$rank_q5, m5$Income.Group)
# Answer 5
# High income: nonOECD High income: OECD Low income
# (1,38.6]     0                    4                17          0
# (38.6,76.2]  0                    5                10          1
# (76.2,114]   0                    8                 1          9
# (114,152]    0                    4                 1         16
# (152,190]    0                    2                 0         11

# Lower middle income Upper middle income
# (1,38.6]  ==>                 5                  11
# (38.6,76.2]                  13                   9
# (76.2,114]                   11                   8
# (114,152]                     9                   8
# (152,190]                    16                   9
