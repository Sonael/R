a <- gl(2, 100, labels = c("M", "F"))

length(a)


drinks <- factor(c("beer","beer","wine","water"))



levels(drinks)[1] <- "water"


Nomes<- c("João", "Paula", "Maria", "Ingrid", "José", "Marcos")
Pesos<- c(80, 65, 70, 58, 78, 70)
Alturas<-c(1.70, 1.66, 1.65, 1.60, 1.76, 1.70)

lista_pessoas <- list(Nomes,Pesos,Alturas)
IMC <- Pesos/Alturas^2


lista_pessoas$IMC <- IMC

lista_pessoas[[1]][1]


class(Nomes)

lista_pessoas[[4]][3]



lista<-lapply(airquality, function(x){mean(x)})

mean(c(lista$Wind,lista$Temp,lista$Month,lista$Day),na.rm = TRUE)

load("chuvas.RData")

str(chuvas)

mean(chuvas)

dia_14 <- sum(chuvas[,14])


mun_81 <- sum(chuvas[81,1:10])


aux<-chuvas["mun_81" , ]; aux<-sum(aux[c(1:10)])
