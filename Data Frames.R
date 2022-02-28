#criando um data frame

A <- c(1,2,3,4)
B <- c("João","Maria", "José", "Pedro")

C <- c(3.0,5.0,2.5,1.0)

meu.banco <- data.frame("ID"=A,"Nome"=B,"Peso"=C,stringsAsFactors = FALSE)

#adicionando uma coluna ao data frame

meu.banco$Idade <- c(20,23,21,30)
  #meu.banco <- cbind(meu.banco, Idade)


#Slicing com [,]

meu.banco[1,]
meu.banco[,4]
meu.banco[1:2, 1:2]


#Slicing com Vetor Logico

meu.banco[meu.banco$Nome == "João",]


#*Criar um novo df com apenas as linhas de InsectSprays onde spray seja igual
#* a A ou B e count > 10

df <- InsectSprays[(InsectSprays$spray == "A" | InsectSprays$spray == "B")
                   & InsectSprays$count < 10, ]

#Slicing com subset()

subset(x = ToothGrowth, 
       subset = len < 20 &
        supp == "OJ" &
        dose >= 1)

#obter colunas especificas

subset(x = ToothGrowth,
       subset = len > 30 & supp == "VC",
       select = c("len","dose"))



#*qual o comprimento médio dos dentes dos porquinhos da
#* india dado o suplemento OJ

oj <- subset(x = ToothGrowth,
             subset = supp == "OJ")


mean(oj$len)  



#Qual o peso médio das galinhas onde a dieta é 1

View(
  ChickWeight
)

diet <- subset(x = ChickWeight,
            subset = Diet == 1)

mean(diet$weight)  


#usando a função with

with(diet, weight / Chick)
  


#Removendo NA do data set

total <- sum(is.na(airquality))

x <- airquality[complete.cases(airquality),]

total <- sum(is.na(x))

setwd("C:/Users/sonae/Documents/R")
