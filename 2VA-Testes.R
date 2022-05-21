library(rstatix)
library(dplyr)
library(gplots)
library(car)
library(ggpubr)
library(vca)
library(ez)
library(PMCMRplus)
library(nortest)

verificaHO <- function(pvalue,ns=0.05)
{
  if(pvalue > ns)
  {
    print("Aceita hipotese nula")
  }
  else
  {
    print("Rejeita a hipotese nula")
  }
}


verificaNormalidade <- function(x,ns=0.05)
{
  if(length(x) <= 50)
  {
    x <- shapiro.test(x)
  }
  else
  {
    require(nortest)
    x <- ad.test(x)
  }
  
  if(x$p.value>ns)
  {
    print("os dados seguem uma distribuição normal")
  }
  
  else
  {
    print("Os dados não seguem uma distribuição normal")
  }
}

verificaVariancias <- function(x,y,ns=0.05)
{
  x <- var.test(x,y)
  if(x$p.value > ns)
  {
    print("As variancias são homogeneas")
  }
  else
  {
    print("As variancias não são homogeneas")
  }
}


View(VADeaths)

colors <- c("yellow", "orange", "red","#CC0000","#660000")

months <- c("Mar", "Apr", "May", "Jun", "Jul")

regions <- c("50-54","55-59", "60-64","65-69","70-79")

barplot(VADeaths, main = "Death rates",
        xlab = "Population",
        ylab = "Death",
        col = colors,
        beside = T)


legend("topleft",pch= c(15,15,15), col = colors, legend = regions)

#############################################################################
Pacientes <- c('moderado','leve','severo')

x <- c(9,8,3)

pct <- round(x/sum(x)*100)


lbls <- paste(pct,"%",sep = "")


pie(x, lbls,
    main = "Pacientes",
    col = rainbow(3))

legend("topright",
       legend = c('moderado','leve','severo'),
       cex = 0.8, fill = rainbow(length(x)))


##################################################################################

flu <- read.csv2('flu.csv')

n <- 100

tammedia <- 500

xbar <- rep(NA,n)

for(i in 1:n)
{
  MinhaAmostra <- sample(flu$age,size = tammedia)
  xbar[i] <- mean(MinhaAmostra)
}

hist(xbar,col="grey",
     probability = T, main = 'Histogram of Flu',
     xlab = 'Age')
densityFlu <- density(xbar)

lines(densityFlu)



##########################################################################



sd <- 0.5

N <- 300

erro <- 0.1

nc <- (1-0.99)/2

n <- (qnorm(nc,lower.tail = F)^2*sd^2*N)/((erro^2*(N-1)))+(qnorm(nc,lower.tail = F)^2*sd^2)

round(n,2)

###############################################################################

library(MASS)

attach(anorexia)


View(anorexia)

antes <- anorexia$Prewt
depois <- anorexia$Postwt

peso <- t.test(antes,depois,paired = T,
                      var.equal = T)

verificaHO(peso$p.value)

verificaNormalidade(antes)

verificaNormalidade(depois)

verificaVariancias(antes, depois)

###############################################################################
nc = 0.05
vinte_anos <- c(27, 26, 21, 24,15,18, 17,12,13)

sessenta_anos <- c(26, 29, 29, 29, 27,16, 20, 27)

voca <- t.test(vinte_anos,sessenta_anos,alternative = "two.sided", conf.level = nc, var.equal = T)
verificaHO(voca$p.value)

verificaNormalidade(vinte_anos)

verificaNormalidade(sessenta_anos)

verificaVariancias(vinte_anos, sessenta_anos)

#################################################################################


load("response.time.RData")


dados <- response.time[response.time$slave_count == 1,]


farthest <- dados[dados$slave_info == 'farthest',]
nearest <- dados[dados$slave_info == 'nearest',]

verificaNormalidade(farthest$value)

verificaNormalidade(nearest$value)

verificaVariancias(vinte_anos, sessenta_anos)

aux <- wilcox.test(x = nearest$value,y = farthest$value)

verificaHO(aux$p.value)

################################################################################
(1-pnorm(500,mean = 400, 45))*100

(1-pnorm(500, mean= 400, sd= 45))*100

(1-pnorm(30, mean= 50, sd= 10))*100


#################################################################################
load("bdims.RData")

View(bdims)

mulher <- bdims[bdims$sex == 0, ]

amostra <- mulher$hgt


#Desviopadrão
d <-sd(amostra)
#Médiada amostra
x <-mean(amostra)
#Tamanhoda amostra
n <-length(amostra)
#Erro
error <-d/sqrt(n)
#Nível de confiança
nc<-(1-0.985)/2
#Limiteinferior
left <-x-(qt(nc,df=n-1, lower.tail= F)*error)
#Limitesuperior
right <-x+(qt(nc,df=n-1,lower.tail = F)*error)
cat("[",left, "-", right,"]")



######################################################################
aux <- data.frame(Instrutor, Software, Words.per.minute)
Instrutor<-c(rep("Dr. Katz Professional Therapist",12),rep('Laura the Receptionist',12),rep('Ben Katz',12))
Software <- c(rep(c(rep("A",4), rep("B",4), rep("C",4)),3))
Words.per.minute<-c(35, 50, 55, 60, 65, 60, 70, 55, 45, 55, 60, 45, 55, 60, 75, 65, 60, 70, 75, 70, 65, 72, 73, 65, 55, 55, 70, 55, 65, 60, 70, 60, 60,62,63,65)

aux$Instrutor <- as.factor(aux$Instrutor)
aux$Software <- as.factor(aux$Software)
aux$Words.per.minute <- as.factor(aux$Words.per.minute)





str(aux)

res.aov2 <- aov(aux$Words.per.minute~aux$Instrutor + aux$Software, data = aux)

summary(res.aov2)

aux %>%
  group_by(Instrutor, Software) %>%
  shapiro_test(Words.per.minute)
