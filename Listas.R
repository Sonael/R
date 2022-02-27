#criando uma lista

mylist <- list(Nome="Sonael", CPF=000000,resp=c(TRUE,FALSE,TRUE))

#visualizar a estrutura de uma lista

str(mylist)


#acessando os elementos da lista

mylist[2]

mylist[c(T,F,T)]

mylist$Nome

mylist[[3]][3]


#alterando um elemento da lista
mylist[2] <- 1111111

mylist[[3]][2] <- T

#removendo um elemento da lista

mylist[2]<- NULL

#adicionando elementos a lista

mylist$Nome <- "Sonael Neto"

mylist$CPF <- 11111111


#convertendo uma lista em um vetor

x <- unlist(mylist)
