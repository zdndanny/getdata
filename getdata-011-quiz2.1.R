# In general look at the documentation

# httr allows GET, POST, PUT, DELETE requests if you are authorized
# You can authenticate with a user name or a password
# Most modern APIs use something like oauth
# httr works well with Facebook, Google, Twitter, Githb, etc.
library(httr)
library(jsonlite)
# Question 1
# Register an application with the Github API here https://github.com/settings/applications. 
# Access the API to get information on your instructors repositories 
# (hint: this is the url you want "https://api.github.com/users/jtleek/repos"). 
# Use this data to find the time that the datasharing repo was created. 
# What time was it created? 
# This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
# You may also need to run the code in the base R package and not R studio. 
#
# my application at github https://github.com/settings/applications/158987
#https://github.com/settings/applications/169180
#Client ID
#e045aa2afac08d2bc9ac
#Client Secret
#67ed8b7da3647c8a0e7cc04b1765ed3bfd2105b8

Sys.setenv(GITHUB_CONSUMER_SECRET = "67ed8b7da3647c8a0e7cc04b1765ed3bfd2105b8")

# Create an OAuth Application
myapp = oauth_app("github",key="e045aa2afac08d2bc9ac")
myapp

# Generate an oauth2.0 token.
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
url = "https://api.github.com/users/jtleek/repos"

req <- GET(url, gtoken)
stop_for_status(req)

json2  <-  fromJSON(toJSON(content(req)))
json2$created_at[json2$name == "datasharing"]
#[[1]]
#[1] "2013-11-07T13:25:07Z"