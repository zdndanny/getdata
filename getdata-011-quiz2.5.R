# Question 5
# Read this data set into R and report the sum of the numbers in the fourth of the nine columns.

# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for

# Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for

# (Hint this is a fixed width file format)


setwd("c:/Users/zeng/workspace/getdata/")
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

