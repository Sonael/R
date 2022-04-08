strg <- c("VodKa 30", "CaNa 25", "ViNHo 23", "Ozônio 22")


paste(strg,'+', sep = '')
tolower(paste(strg,'+', sep = ''))


test = c("5!eAZ","!6!rrrrDFGT","R99Tf34!RR","123?aSd","1.z11111")


grep(pattern = "^([0-4][[:punct:]][a-z])", test, value = TRUE)


nchar(test)

install.packages("readr")
library(readr)

test <- read_file("gambler.txt")

nchar(test)


install.packages("babynames")
library(babynames)

babynames <- as.data.frame(babynames)

library(stringr)


babynames[str_count(babynames$name,"a"),]



###################################################################################################

library(dplyr)
library(tidyr)

forbes <- read.csv(file = "Forbes2000_V2.csv")

head(forbes)

test <- forbes %>% arrange(desc(marketvalue))

test2 <- forbes %>%
  filter(category == "Diversified financials")%>%
  arrange(desc(marketvalue))
  



test$name[1]






ranqueamento <- function(ranque,categoria,opcao)
{
  if(opcao == 1)
  {
    resul <- forbes %>% arrange(desc(marketvalue))
    mensagem <- paste("Empresa:",resul$name[ranque],"Categoria:", resul$category[ranque], "ranking:",ranque)
  }
  if(opcao == 2)
  {
    resul <- forbes %>%
      filter(category == categoria)%>%
      arrange(desc(marketvalue))
    mensagem <- paste("Empresa:",resul$name[ranque],"Categoria:", categoria, "ranking:",ranque)
    
  }
  
  return(mensagem)
}


ranqueamento(ranque=7, categoria="Bancos", opcao=2)
######################################################################

install.packages("ggplot2")
library(ggplot2)


View(diamonds)

          

medio <- diamonds %>%
  filter(cut == "Very Good" & carat > 0.7)%>%
  summarise(media = mean(price))

min(diamonds$price)


teste <- diamonds %>%
  filter(carat > 0.5)%>%
  summarise(cor = color,quilate = min(carat),preco = min(price))



teste <- diamonds %>%
  filter(cut == "Premium")


diamantes <- diamonds


13791/53940
#############################################3


install.packages("AER")
library(AER)


data("Fertility")


Fertility%>%slice(35:50)%>%summarise(age,work)


teste <- Fertility %>%
  filter(morekids == "yes" & work > 30)


7567/15024


teste <- Fertility %>%
  filter(age>=22, age<=24)

teste2 <- Fertility %>%
  filter(age>=22, age<=24, gender1 == "male")



################################################################



catfish <- read.csv(file = "Catfish.csv",
                         header = TRUE,
                         strip.white = T,
                         na.strings = "")



catfish <- catfish %>%
  unite(col = "Species",
        Genus,Species,
        sep = ".")

Catfish_Treatment <- merge(x = treatment,
                           y = catfish,
                           by = "Tank",
                           all = T)

head(Catfish_Treatment)

Catfish_Treatment <- Catfish_Treatment %>%
  gather(key = "Meses",value = "Weight",-Tank,-Temperature,-Food,-ID,-Species,-Sex,-Year)


Catfish_Treatment %>%
  filter(Sex == "Male", Food == "Treatment2", Meses == "April")%>%
  summarise(mean(Weight))
  


mean(Catfish_Treatment$Weight)
Catfish_Treatment$AcimaMedia<-ifelse(Catfish_Treatment$Weight>mean(Catfish_Treatment$Weight),'V','F')


teste <- Catfish_Treatment %>%
  filter(Weight < mean(Weight))


Catfish_Treatment %>%
  filter(Tank == "Tank4", AcimaMedia == "V")%>%
  summarise(count = n())


####################################################################333

M_resultados <- c(42, 70, 40, 1500, 97)
T_resultados <- c(38, 173, 71, 1554, 70)
F_resultados <- c(50, 150, 40, 1900, 40)
J_resultados <- c(40, 140, 80, 2093, 100)
media <- c(30, 155, 50, 1829, 75)
sd <- c(6, 23, 8, 274, 12)

escore_M <- (M_resultados-media)/sd
escore_T <- (T_resultados-media)/sd
escore_F <- (F_resultados-media)/sd
escore_J <- (J_resultados-media)/sd

mean(escore_M)
mean(escore_T)
mean(escore_F)
mean(escore_J)




casosCompletos <- function(df, linhas=NA)
{
  
  if(!is.na(linhas))
    df <- df %>% slice(linhas)
  return(count(df[complete.cases(df),]))
}


casosCompletos(df = airquality, linhas = 1:10)


