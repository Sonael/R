#media

mean()


#Mediana

median()


#moda 

conjunto <- table(conjunto)

names(conjunto)[which(y == max)]

names(table(conjunto))[table(conjunto)==max(table(conjunto))]


moda <- function(conjunto)
{
  names(table(conjunto))[table(conjunto)==max(table(conjunto))]
}


moda(airquality$Temp)



#Quartis


summary(airquality$Temp)



#Medidas de Dispers�o


#M�ximo

max(airquality$Temp)


#Minimo

min(airquality$Temp)


#Amplitude

AT <- max(airquality$Temp) - min(airquality$Temp)

AT


#variancia

var(airquality$Temp)


#desvio padr�o

sd(airquality$Temp)


#Estatisca Inferencial


#Fa�a um programa que simule o lan�amento de uma moeda justa 100 vezes


x <- c("Cara", "Coroa")

y <- sample(x, size = 1000, replace = T)

table(y)


#Altere o programa que simula o lan�amento de um moeda 100 vezes para que fique
#tendencioso para "Coroa"


x <- c("Cara", "Coroa")

y <- sample(x, size = 1000, replace = T,prob = c(0.1,0.9))

table(y)


#Amostragem Estratificada


stratified(iris,group="Species",
           size = 5,replace = T)


#Agora vamos gerar amostras do dataset infert, mas que sejam proporcionais a 
#cada grupo da coluna education



p1 <- sum(infert$education == "0-5yrs")/length(infert$education)
p2 <- sum(infert$education == "6-11yrs")/length(infert$education)
p3 <- sum(infert$education == "12+ yrs")/length(infert$education)

install.packages("splitstackshape")
library(splitstackshape)

View(stratified(infert, group = "education", size = c(0.1,0.5,0.4), replace = T))


#*Voc� deseja estimar a renda m�dia dos ex-alunos da Ruralinda; admite-se 
#*que esta popula��o seja infinita. Quantos valores de renda devem ser 
#*tomados, se o voc� deseja ter um n�vel de confian�a 90% e um erro m�ximo 
#*de 300 reais? Suponha que saibamos, por um estudo pr�vio, que para tais 
#*rendas, ?? = R$4250,00. Use apenas duas casas decimais para submeter sua 
#*resposta (sem arredondamento). Ex.:123.239586 -> 123.23.


sd <- 4250

erro <- 300 

nc <- (1-0.9)/2


n <- ((qnorm(nc,lower.tail = F)*sd)/erro)^2



#*Suponha que a vari�vel escolhida num estudo seja o peso dos alunos da 
#*Ruralinda e que a popula��o � composta de 1500 alunos. Pelo um estudo  
#*pr�vio dos pesos, o desvio-padr�o � de 5 kg. Admitindo-se um n�vel de 
#*confian�a de 95,5% e um erro amostral de 1,5 kg, calcule o tamanho da 
#*amostra para estimar o peso m�dio dos alunos da Ruralinda. Use apenas 
#*duas casas decimais para submeter sua resposta (sem arredondamento). 
#*Ex.:123.239586 -> 123.23.


sd <- 5

N <- 1500

erro <- 1.5

nc <- (1-0.95)/2


n <- (qnorm(nc,lower.tail = F)^2*sd^2*N)/((erro^2*(N-1)))+(qnorm(nc,lower.tail = F)^2*sd^2)




#*A ministro da educa��o est� interessado em conhecer o gasto m�dio por 
#*estudante nos restaurantes universit�rios. O ministro admite que a 
#*despesa de um aluno possa variar entre R$ 10,00 e R$ 30,00. Ele desejam 
#*um grau de confian�a de 98 % e admite uma margem de erro de R$ 1. Calcule 
#*o tamanho da amostra para esta pesquisa. Use apenas duas casas decimais 
#*para submeter sua resposta (sem arredondamento). Ex.:123.239586 -> 123.23.

sd <- (30-10)/4

N <- 5.000

erro <- 1 

nc <- (1-0.98)/2

n <- ((qnorm(nc,lower.tail = F)*sd)/erro)^2


n <- (qnorm(nc,lower.tail = F)^2*sd^2*N)/((erro^2*(N-1)))+(qnorm(nc,lower.tail = F)^2*sd^2)





#*Em um hospital psiqui�trico, os pacientes permaneceram internados, em m�dia, 
#*cinquenta dias, com desvio padr�o de dez dias. Se for razo�vel pressupor que 
#*o tempo de perman�ncia tem distribui��o aproximadamente normal, qual a 
#*probabilidade de um paciente permanecer no hospital por mais de trinta 
#*dias ? Submeta a resposta em porcentagem com duas casas decimais. Por 
#*exemplo: 0.9452899 -> 94.52%.

pnorm(30,mean = 50, 10)
