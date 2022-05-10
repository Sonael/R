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



#Medidas de Dispersão


#Máximo

max(airquality$Temp)


#Minimo

min(airquality$Temp)


#Amplitude

AT <- max(airquality$Temp) - min(airquality$Temp)

AT


#variancia

var(airquality$Temp)


#desvio padrão

sd(airquality$Temp)


#Estatisca Inferencial


#Faça um programa que simule o lançamento de uma moeda justa 100 vezes


x <- c("Cara", "Coroa")

y <- sample(x, size = 1000, replace = T)

table(y)


#Altere o programa que simula o lançamento de um moeda 100 vezes para que fique
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


#*Você deseja estimar a renda média dos ex-alunos da Ruralinda; admite-se 
#*que esta população seja infinita. Quantos valores de renda devem ser 
#*tomados, se o você deseja ter um nível de confiança 90% e um erro máximo 
#*de 300 reais? Suponha que saibamos, por um estudo prévio, que para tais 
#*rendas, ?? = R$4250,00. Use apenas duas casas decimais para submeter sua 
#*resposta (sem arredondamento). Ex.:123.239586 -> 123.23.


sd <- 4250

erro <- 300 

nc <- (1-0.9)/2


n <- ((qnorm(nc,lower.tail = F)*sd)/erro)^2



#*Suponha que a variável escolhida num estudo seja o peso dos alunos da 
#*Ruralinda e que a população é composta de 1500 alunos. Pelo um estudo  
#*prévio dos pesos, o desvio-padrão é de 5 kg. Admitindo-se um nível de 
#*confiança de 95,5% e um erro amostral de 1,5 kg, calcule o tamanho da 
#*amostra para estimar o peso médio dos alunos da Ruralinda. Use apenas 
#*duas casas decimais para submeter sua resposta (sem arredondamento). 
#*Ex.:123.239586 -> 123.23.


sd <- 5

N <- 1500

erro <- 1.5

nc <- (1-0.95)/2


n <- (qnorm(nc,lower.tail = F)^2*sd^2*N)/((erro^2*(N-1)))+(qnorm(nc,lower.tail = F)^2*sd^2)













#*A ministro da educação está interessado em conhecer o gasto médio por 
#*estudante nos restaurantes universitários. O ministro admite que a 
#*despesa de um aluno possa variar entre R$ 10,00 e R$ 30,00. Ele desejam 
#*um grau de confiança de 98 % e admite uma margem de erro de R$ 1. Calcule 
#*o tamanho da amostra para esta pesquisa. Use apenas duas casas decimais 
#*para submeter sua resposta (sem arredondamento). Ex.:123.239586 -> 123.23.

sd <- (30-10)/4

N <- 5.000

erro <- 1 

nc <- (1-0.98)/2

n <- ((qnorm(nc,lower.tail = F)*sd)/erro)^2


n <- (qnorm(nc,lower.tail = F)^2*sd^2*N)/((erro^2*(N-1)))+(qnorm(nc,lower.tail = F)^2*sd^2)





#*Em um hospital psiquiátrico, os pacientes permaneceram internados, em média, 
#*cinquenta dias, com desvio padrão de dez dias. Se for razoável pressupor que 
#*o tempo de permanência tem distribuição aproximadamente normal, qual a 
#*probabilidade de um paciente permanecer no hospital por mais de trinta 
#*dias ? Submeta a resposta em porcentagem com duas casas decimais. Por 
#*exemplo: 0.9452899 -> 94.52%.


pnorm(30,mean = 50, 10)
