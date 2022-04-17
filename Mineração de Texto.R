install.packages("tm")
install.packages("wordcloud")
library(tm)
library(wordcloud)
library(readr)


motivos <- read.csv("motivos.csv",
                    header = T,
                    stringsAsFactors = F)


motivos <- read_csv("motivos.csv")


#colapsando todos os  comentários em um vetor de uma posição
motivos_colap <- paste(motivos$"2019.1",collapse = " ") 


#*Para processar o texto usando o pacote tm, é necessário coverter esses dados em um formato chamado
#*corpus, que pode ser processado pelo formato tm.

VS <- VectorSource(motivos_colap)
corpus <- Corpus(VS)


#verificando o arquivo corpus gerado

inspect(corpus)



#Limpeza


#colocar tudo em minusculo
corpus <- tm_map(corpus, content_transformer(tolower))


#remover toda a pontuação

corpus <- tm_map(corpus, removePunctuation)


#remover espaços extras em branco

corpus <- tm_map(corpus, stripWhitespace)

#Remover números

corpus <- tm_map(corpus, removeNumbers)


#remover palavras ruido

corpus <- tm_map(corpus, removeWords, stopwords("portuguese"))


#verificando o corpus apos a limpeza

inspect(corpus)


#converter para o formato de uma matriz

tdm <- as.matrix(TermDocumentMatrix(corpus))


#fornecer as sequencias ordenadas de cada palavra

fre <- sort(rowSums(tdm),decreasing = T)

#Escolhendo um subconjunto dos dados

aux <- subset(fre, fre>2)

#plota o gráfico de barras dos termos mais frequentes

barplot(aux, las=2, col = rainbow(10))


#Gerar nuvem de palavras

#*Corpus : O vetor de palavras a ser plotado
#*min.freq : Palavras com frequencia menor que essas não serão mostradas
#*max.words : Máximo de palavras a serem plotadas
#*random.order : Plota as palavras em ordem randomica
#*               #false significa que são plotadas as palavras mais frequentes.
#*rot.per : Quantidade de rotação para aplicar a cada palavra(0-1).
#*colors : Cores a serem usadas

wordcloud(corpus, min.freq = 1,max.words = 60,random.order = F,
          rot.per = 0.35, colors = brewer.pal(8,"Dark2"))
