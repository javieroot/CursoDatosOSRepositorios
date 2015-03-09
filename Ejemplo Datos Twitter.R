############################################################################################################################
# Este script http://decisionstats.com/2014/02/26/using-r-with-twitter-great-tutorial-in-rstats/
# 

library(twitteR)
library(ROAuth)
library(RCurl)
library("XML")
require(RJSONIO) 

getTwitterOAuth("67IaqEiVY5pGvBfybvK22g", "nvbCMgRwyFFbwNjSXqUZHzpGlGAhjQ6FgIMadQVI")
registerTwitterOAuth(oauth)

tweets = searchTwitter("fundacion juan march")
tweets = searchTwitter("fundacion juan march", since='2012-01-01', until='2012-12-30')

PodemosTweets = userTimeline("ahorapodemos", n=100)
PodemosTweets <- as.data.frame(PodemosTweets)
PodemosTweetsDB <-twListToDF(PodemosTweets)
PodemosTweetsDBText <- PodemosTweetsDB[1]

write.table(PodemosTweetsDBText, "PodemosTweetsDBText.csv", sep=";")