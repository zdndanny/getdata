library(httr)
# httr allows GET, POST, PUT, DELETE requests if you are authorized
# You can authenticate with a user name or a password
# Most modern APIs use something like oauth
# httr works well with Facebook, Google, Twitter, Githb, etc.


# Question 1
# Register an application with the Github API here https://github.com/settings/applications. 
# Access the API to get information on your instructors repositories 
# (hint: this is the url you want "https://api.github.com/users/jtleek/repos"). 
# Use this data to find the time that the datasharing repo was created. 
# What time was it created? 
# This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
# You may also need to run the code in the base R package and not R studio. 
#
# Regristered my application at github https://github.com/settings/applications/177875
# Client ID
# Client Secret

# keep the Secret in an envvar
#  GITHUB_CONSUMER_SECRET

# Create an OAuth Application
myapp = oauth_app("github",key="a94a2341da6dac465919")
myapp

# Generate an oauth2.0 token.
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
github_token
# 
# <Token>
#   <oauth_endpoint>
#   authorize: https://github.com/login/oauth/authorize
# access:    https://github.com/login/oauth/access_token
# <oauth_app> github
# key:    a94a2341da6dac465919
# secret: <hidden>
#   <credentials> access_token, scope, token_type
# ---


gtoken <- config(token = github_token)
url = "https://api.github.com/users/jtleek/repos"

req <- GET(url, gtoken)
stop_for_status(req)

library(jsonlite)

json2  <-  fromJSON(toJSON(content(req)))
json2$created_at[json2$name == "datasharing"]
#[[1]]
#[1] "2013-11-07T13:25:07Z"


# Question 2
# The sqldf package allows for execution of SQL commands on R data frames. 
# We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL. Download the American Community Survey data and load it into an R object called
library(sqldf)

#url  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
url  <- "data/getdata_data_ss06pid.csv"
acs  <- read.csv(url)

# Which of the following commands will select only the data for the 
# probability weights pwgtp1 with ages less than 50?

sqldf("select pwgtp1 from acs where AGEP < 50")
# sqldf("select pwgtp1,AGEP from acs where AGEP < 5")
# sqldf("select * from acs")
# sqldf("select pwgtp1 from acs")
# sqldf("select * from acs where AGEP < 50 and pwgtp1")

#Question 3
# Using the same data frame you created in the previous problem, 
# what is the equivalent function to unique(acs$AGEP)
sqldf("select distinct AGEP from acs")
#sqldf("select unique * from acs")
#sqldf("select distinct pwgtp1 from acs")
#3sqldf("select AGEP where unique from acs")


#Question 4
#How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:

#  http://biostat.jhsph.edu/~jleek/contact.html

# (Hint: the nchar() function in R may be helpful)

# setwd("c:/Users/zeng/workspace/getdata/")
url  <- "http://biostat.jhsph.edu/~jleek/contact.html"
html  <- "data/contact.html"
if (!file.exists(html)) {download.file(url, html)}

con  <- file(html, "r")
lines <- readLines(con)
close(con)
wc <- nchar(lines)
wc[c(10,20,30,100)]
# [1] 45 31  7 25


# Question 5
# Read this data set into R and report the sum of the numbers in the fourth of the nine columns.

# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for

# Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for

# (Hint this is a fixed width file format)

# setwd("c:/Users/zeng/workspace/getdata/")
url  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
dl  <- "data/getdata_wksst8110.for"
if (!file.exists(dl)) { download.file(url, dl)}
dateDownloaded <- date()
dl
dateDownloaded

# first few lines of the file
#####
# Weekly SST data starts week centered on 3Jan1990
#
#             Nino1+2      Nino3        Nino34        Nino4
#Week          SST SSTA     SST SSTA     SST SSTA     SST SSTA  <<< skip 4 lines
#03JAN1990     23.4-0.4     25.1-0.3     26.6 0.0     28.6 0.3
#10JAN1990     23.4-0.8     25.2-0.3     26.6 0.1     28.6 0.3


# Read fixed-format data files using Fortran-style format specifications.
# read.fortran(file, format, ..., as.is = TRUE, colClasses = NA)
format  <-c("A10","X4","F5","F4","X4","F5", "F4","X4","F5","F4","X4","F5","F4")
#format  <-c("A9","X3","F4.1","F4.1","X3","F4.1","F4.1","X3","F4.1","F4.1","X3","F4.1","F4.1")
df  <- read.fortran(dl, format, sep="\t", skip = 4)

sum(df[,4])
#  [1] 32426.7

#widths  <- c(10,9,4,9,4,9,4,9,4)
#cols  <- c("week", "Nino12SST", "Nino12SSTA", "Nino3SST", "Nino3SSTA", "Nino34SST", "Nino34SSTA", "Nino4SST", "Nino4SSTA")
#fwf  <- read.fwf(dl, widths, skip = 4, col.names = cols)
