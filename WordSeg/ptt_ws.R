rm(list=ls())
# install.packages("jiebaR")
#install.packages("Rwordseg", repos="http://R-Forge.R-project.org")
# install.packages("tm")
#install.packages("tmcn", repos="http://R-Forge.R-project.org", type="source")
# install.packages("wordcloud")
#install.packages("XML")
# install.packages("RCurl")
library(mongolite)
library("jiebaR")


# read files
#odigo = mongo(collection = "odigo", db = "text_mining", url = "mongodb://127.0.0.1:27017",
#              verbose = FALSE, options = ssl_options())
#mobile = mongo(collection = "mobile01_article", db = "text_mining", url = "mongodb://127.0.0.1:27017",
#              verbose = FALSE, options = ssl_options())
#pixnet = mongo(collection = "pixnet", db = "text_mining", url = "mongodb://127.0.0.1:27017",
#              verbose = FALSE, options = ssl_options())
#ptt = mongo(collection = "ptt_article", db = "text_mining", url = "mongodb://127.0.0.1:27017",
#              verbose = FALSE, options = ssl_options())

# files records amount

odigo$count(query = "{}")   #[1] 3054 
mobile$count(query = "{}")  #[1] 7702
pixnet$count(query = "{}")  #[1] 1207
ptt$count(query = "{}")     #[1] 87480

# ptt structure

## ptt$find(query = "{}", fields = "{\"_id\":0}", sort = "{}", skip = 0, limit = 5, handler = NULL, pagesize = 1000)
record100 = ptt$find(query = "{}", fields = "{\"_id\":0}", sort = "{}", skip = 0, limit = 100)
dim(record100)
record1[6]   #  1: ID, 2:date, 3: title, 4: url, 5:content 6. comment
str(record1[6])


# 斷詞
wk = worker()
wk["給你看看jieba worker的能力"]
ws1 = wk[toString(record1[5])]
ws2 = wk[toString(record100[10,5])]
ws3 = wk[toString(record100[11,5])]
record100[11,3]
table(ws1)
segment(toString(record1[5]), wk)
library(Rwordseg)


# rank
str(table(ws1))
table(ws1)[order( -table(ws1) )[1:30]]




# odigo

odigo
