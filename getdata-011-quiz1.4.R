# Question 4 
# Read the XML data on Baltimore restaurants from here:
library(XML)  
url  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
file  <- "data//getdata_data_restaurants.xml"
if(!file.exists(file)) {download.file(url, destfile = file)}
dataDownloaded  <- date()
dataDownloaded
# How many restaurants have zipcode 21231? 
doc  <- xmlInternalTreeParse(file)
rootNode  <- xmlRoot(doc)
xmlName(rootNode)
zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zip == "21231")
# [1] 127

