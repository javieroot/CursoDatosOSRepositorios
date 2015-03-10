############################################################################################################################
# Este script demuestra como caputar datos de twitter usando R
# con los datos que obtengamos montaremos una nube de etiquetas usando wordle

# cargamos algunas librerias que pueden hacernos falta
library(twitteR)
library(ROAuth)
library(RCurl)
library(httr)

# autenticación contra la app creada anteriormente en twitter como se explica en
# http://decisionstats.com/2014/02/26/using-r-with-twitter-great-tutorial-in-rstats/
# hace falta poner los cuatro parametros consumer key, secret, access token y access secret

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# buscamos tweets con el hashtag #OSR6
OSRE6tweets = searchTwitter("#OSR6")
OSRE6tweetsDB <-twListToDF(OSRE6tweets)
OSRE6TweetsDBText <- OSRE6tweetsDB[1]
write.table(OSRE6TweetsDBText, "OSRE6TweetsDBText.csv", sep=";")

# descargamos el timeline de podemos
PodemosTweets = userTimeline("ahorapodemos", n=100)
PodemosTweetsDB <-twListToDF(PodemosTweets)
PodemosTweetsDBText <- PodemosTweetsDB[1]

write.table(PodemosTweetsDBText, "PodemosTweetsDBText.csv", sep=";")