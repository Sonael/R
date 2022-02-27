#repetição

v <- c(1,2,3)

length(v)

max(v)

min(v)

rep(v,3)

rep(c(1,2,3), 1:3)

rep(c(1,2,3), each = 3)

#sequencia

1:5

seq(1,6,1)


# usando a função summary

vetor <- c(2,4,4,5,6,7,8)
summary(vetor)


#conversão

aux <- c(10,2,0,1)
class(aux)

aux <- as.character(aux)
class(aux)

#acessar elementos de um vetor

vetor[1]

vetor[c(1,4)]

vetor[1:5]

#indexação logica

boat.names <- c("a","b","c","d")
boat.colors <- c("preto","verde","rosa","azul")
boat.ages <- c(143,53,356,23)
boat.prices <- c(53,87,54,66)
boat.costs <- c(52,80,20,100)

boat.ages > 100
boat.names == 'c'

boat.prices > boat.costs

boat.prices[boat.ages > 100]

#usando o which

which(vetor>4)

vetor[which(vetor>4)]


#criando um vetor vazio

vetor.vazio <- vector(mode = "numeric",length = 3)

vetor.vazio[1] <- 1
vetor.vazio <- c(vetor.vazio,NA)

mean(vetor.vazio, na.rm = TRUE)




#padronização de valores
piratas <- c("Heide", "Andrew", "Becki", "Maidsen", "David")
beber <- c(12,8,1,6,2)
escalada <- c(100,520,430,200,700)

#*Padronizando a variável beber
beber.n <- (beber-mean(beber))/sd(beber)

#*padronizando o vetor escalada
escalada.n <- (escalada-mean(escalada))/sd(escalada)


media <- (beber.n+escalada.n)/2

piratas[max(media) == media]
