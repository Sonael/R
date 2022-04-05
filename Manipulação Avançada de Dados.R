#Função Merge

risco.survey <- data.frame("ID.part" = c(1,2,3,4,5),
                           "av.risco"= c(3,4,5,3,1))


felicidade.survey <- data.frame("ID.part" = c(4,2,5,1,3),
                                "feli.score" = c(20,40,50,90,53))


combinado.survey <- merge(x = risco.survey,
                          y = felicidade.survey,
                          by = "ID.part",
                          all = T)



#Colunas com nomes diferentes

risco.survey <- data.frame("ID.part1" = c(1,2,3,4,5),
                           "av.risco"= c(3,4,5,3,1))


felicidade.survey <- data.frame("ID.part2" = c(4,2,5,1,3),
                                "feli.score" = c(20,40,50,90,53))


combinado1.survey <- merge(x = risco.survey,
                           y = felicidade.survey,
                           by.x = "ID.part1",
                           by.y = "ID.part2",
                           all = T)



#função aggregate

#* Usando o data frame ChickWeight responda: "Qual o peso médio das galihas para cada dieta?"

aggregate(formula = weight ~ Diet,
          FUN = mean,
          data = ChickWeight)

View(ChickWeight)


#* Qual foi a temperatura média de NY para os meses do estudo descrito no dataset airquality,


aggregate(formula = Temp ~ Month,
          FUN = mean,
          data = airquality)




#* Qual foi a temperatura média de NY para os meses do estudo descrito no dataset airquality,
#* mas somente para os casos onde o vento foi menor que 10?

aggregate(formula = Temp ~ Month,
          FUN = mean,
          subset = Wind < 10,
          data = airquality)




# O pacote dplyr


install.packages("dplyr")
library(dplyr)

#função filter
filter(airquality, Temp>70,Wind>14)


#função select
head(select(airquality,Temp,Wind))


#função mutate
df <- mutate(airquality, celsius = (airquality$Temp-32)/1.8)

head(df)

#função arrange

head(arrange(df,celsius))


#summarise e group_by

summarise(airquality,
          maxfahrenheit = max(Temp),
          Contador = n())


temp_by_month <- group_by(airquality,Month)

summarise(temp_by_month,maxfahrenheit = max(Temp))



#o operador %>% (chamado de pipe)

airquality %>%
  group_by(Month) %>%
  filter(Temp > 80) %>%
  summarise(
    SomaTemp = sum(Temp),
    mediaWind = mean(Wind)
  )





#Selecionar todas as colunas com exceção da coluna Transmissão (am)

mtcars %>% select(-am)


#selecionar as linhas 10 e 25

mtcars %>% slice(c(10,25))

#ordenar o dataset onde de acordo com a variável Milhas/galão (mpg) em ordem decrescente

mtcars %>% arrange(mpg)
mtcars %>% arrange(desc(mpg))


#selecionar as linhas do dataset onde a quantidade de cilindros (cyl) seja igual a 6

mtcars %>% filter(cyl == 6)


#selecionar as linhas do dataset onde a quantidade de cilindro seja igual a 6 e a quantidade de engrenagens (gear)
#seja igual a 5

mtcars %>% filter(cyl == 6 & gear == 5)


#determinar a média e a mediana da variável Milhas/galão (mpg)

mtcars %>% summarise(media = mean(mpg),median(mpg))
 

#determinar a média e a mediana da variável Milhas/galão (mpg) de acordo com o tipo do motor(vs)

mtcars %>%
  group_by(vs) %>% 
  summarise(media=mean(mpg),median(mpg))



#determinar a média e mediana da variável Milhas/galão (mpg) de acordo com o tipo do motor(vs)
# e o tipo da transmissão (am)

mtcars %>% 
  group_by(vs,am) %>% 
  summarise(media=mean(mpg), median(mpg))



#determinar a média e mediana da variável Milhas/galão (mpg) de acordo com o tipo do motor(vs)
# e o tipo da transmissão (am), porém apenas para os carros com mais de  quatro cilindros(cyl)

mtcars %>% 
  group_by(vs,am) %>% 
  filter(cyl>4) %>% 
  summarise(media=mean(mpg),median(mpg))





#pacote tidyr

install.packages("tidyr")
library(tidyr)


#função gather

USArrests$State <- rownames(USArrests)

head(USArrests)

df1 <- USArrests %>%
  gather(key = "tipo_crime",value = "valor",-State)

head(df1)



#Função spread (é o inverso da função gather)

df2 <- df1 %>%
  spread(key = "tipo_crime",value = "valor")

head(df2)



#Use a função spread para decompor a variável spray em relação a count do dataset InsectSprays

df <- InsectSprays %>%
  group_by(spray) %>%
  mutate(grouped_id = row_number())



df <- df %>%
  spread(key = "spray",value = "count")%>%
  select(-grouped_id)


df <- df %>%
  gather(key = "spray", value = "valor")




#Função unite

df3 <- df2 %>%
  unite(col = "Murder_Assault",
        Murder,Assault,
        sep = " - ")

head(df3)



#Função separate


df4 <- df3%>%
  separate(col = "Murder_Assault",
           into = c("Murder","Assault"),
           sep = " - ")

head(df4)
