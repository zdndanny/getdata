#Question 4
#How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
  
#  http://biostat.jhsph.edu/~jleek/contact.html

# (Hint: the nchar() function in R may be helpful)

setwd("c:/Users/zeng/workspace/getdata/")
url  <- "http://biostat.jhsph.edu/~jleek/contact.html"
html  <- "data/contact.html"
if (!file.exists(html)) {download.file(url, html)}

con  <- file(html, "r")
lines <- readLines(con)
close(con)
wc <- nchar(lines)
wc[c(10,20,30,100)]
