install.packages("syuzhet")
library(twitteR)
library(tm)
library(syuzhet)

consumer_key <- ''

consumer_secret <- ''

access_token <- ''

access_secret <- ''

setup_twitter_oauth(consumer_key, consumer_secret,
                    access_token, access_secret)

tweets <- searchTwitter("#stf",n = 500, lang = 'pt')

tweets <- twListToDF(tweets)

#acessando apenas os textos
tweets <- tweets$text


#Pontuando os tweets

s <- get_nrc_sentiment(tweets)

#*Esse pacote quebra as emoções em 8 tipos diferentes
#*(raiva, antecipação, nojo, medo, alegria, tristesa, surpresa, confiança)
#*e os sentimentos em dois tipos ( negativo, positivo).


barplot(colSums(s), las = 2, col = rainbow(10),
        ylab = "Contagem",main = "Sentimentos em relação aos Tweets")
