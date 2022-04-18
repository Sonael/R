install.packages("twitteR")

library(twitteR)
library(tm)
library(wordcloud)


consumer_key <- ''

consumer_secret <- ''

access_token <- ''

access_secret <- ''


setup_twitter_oauth(consumer_key, consumer_secret,
                    access_token, access_secret)


#consultando o twitter

tweets <- searchTwitter("Stf",n = 100, lang = 'pt')



#convertendo os twittes para o formato de DF

tweets <- twListToDF(tweets)


#colapsando todos os twittes em um vetor de uma posição

tweets_t <- paste(tweets$text, collapse = " ")

#Criando o source e corpus

tweets_t <- VectorSource(tweets_t)
corpus <- Corpus(tweets_t)


#limpeza

corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("portuguese"))



inspect(corpus)


#remover URL's

removeURL <- function(x) gsub("http[^[:space:]]*","",x)
corpus <- tm_map(corpus,removeURL)


#remove qualquer coisa que n seja letras em português e espaço
removeNUmPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
corpus <- tm_map(corpus,content_transformer(removeNUmPunct))


#criar matriz

dtm <- TermDocumentMatrix(corpus)
dtm <- as.matrix(dtm)


#fornecer a frequencia de cada palavra
fre <- sort(rowSums(dtm), decreasing = TRUE)

wordcloud(corpus, min.freq = 3,max.words = Inf,random.order = F,
          rot.per = 0.35, colors = brewer.pal(8,"Dark2"),scale = c(8,.2))
