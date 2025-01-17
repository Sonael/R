install.packages("rstatix")
install.packages("gplots")
install.packages("car")
install.packages("ggpubr")
install.packages("VCA")
install.packages("ez")
install.packages("PMCMRplus")

library(rstatix)
library(dplyr)
library(gplots)
library(car)
library(ggpubr)
library(vca)
library(ez)
library(PMCMRplus)


#################
# Anova fator 1 #
#################

#*Para Executarmos a ANOVA fator 1, iremos usar o dataset PlantGrowth. Esse dataset cont�m
#*o peso das plantas obtidos usando 3 tipos de tratamento distintos. O que queremos saber 
#*�  se os tratamentos afetam ou n�o nos pesos das plantas


#Hipotese nula : As m�dias dos pesos (variavel weight) correspondentes a cada tratamento 
#(group) s�o iguais

#Hipotese alternativa : pelo menos uma das m�dias � difetente das demais


#Verificar a estutura dos dataframe

str(PlantGrowth)

#Plotar m�dias

plotmeans(weight ~ group, PlantGrowth,main = "Plot means")

##########################
# Verificar Pressupostos #
##########################

#Independencia
#As amostras devem ser coletadas de forma independente uma das outras

#Normalidade(Valor de P maior de que 0.05 � Normal)
PlantGrowth %>%
  group_by(group)%>%
  shapiro_test(weight)


#Variancias Homogeneas (Valor de P maior de que 0.05 � homog�nea)

leveneTest(weight ~group, data = PlantGrowth)


#Verificando a exist�ncia de outliers (continuar se n existem outliers extremos)

PlantGrowth %>%
  group_by(group) %>%
  identify_outliers(weight)


####################
# Executar a ANOVA #
####################

#Se o valor de P for menor do que 0.05 ent�o rejeita a hipotese nula

plant.aov <- aov(formula = weight~group,
                 data = PlantGrowth)


summary(plant.aov)


#Executar o teste de post-hoc (tukey)
#*Verificar quais dessas compara��es nao s�o iguais (Se o valor � maior que 0.05
#* � pq n existe diferen�a)

TukeyHSD(plant.aov)



######################
# ANOVA de 2 Fatores #
######################

#*Para executarmos a ANOVA de 2 Fatores, iremos utilizar o dataset ToothGrowth
#*o que queremos saber � se as doses (variavel dose) e/ou suplementos (variavel supp)
#*afetam ou n�o no crescimento dos dentes das cobaias (variavel len)
#*ou seja, queremos saber se as m�dias dos tamanhos dos deentes corespendente a cada
#*dose e suplemente s�o iguais ou n�o. Al�m disso gostariamos de saber se existe intera��o
#*entre supp e dose


#Hipotes Nula
# 1 - As m�dias dos grupos do fator supp s�o iguais
# 2 - As m�dias dos grupos do fator dose s�o iguais
# 3 - N�o h� intera��o entre os fatores supp e dose

#HIpotese Alternativa
# 1 - A hipotese altenativa para os casos 1 e 2 � que as m�dias s�o diferentes
# 2 - A hipotese alternativa  para o caso 3 � que existe uma intera��o entre supp e dose


#Verificar estrutura do dataframe

str(ToothGrowth)


# Alterando a variavel dose para fator

ToothGrowth$dose <- factor(ToothGrowth$dose)

#Plotar m�dias

ggline(ToothGrowth, x = "dose", y = 'len', color = 'supp',
       add = c('mean_se', 'dotplot'),
       palette = c('red','blue'))


##########################
# Verificar Pressupostos #
##########################

#Independencia
#As amostras devem ser coletadas de forma independente uma das outras

#Normalidade
ToothGrowth %>% group_by(dose, supp) %>%
  shapiro_test(len)

#Vari�ncia homog�neas
leveneTest(len ~ supp*dose, data = ToothGrowth)

#Verificando a exist�ncia de outliers
ToothGrowth %>%
  group_by(dose, supp) %>%
  identify_outliers(len)


#Checandos se os dados est�o balaceados

table(ToothGrowth$supp, ToothGrowth$dose)


##############################
# Executar a ANOVA 2 fatores #
##############################

# se P for menor do que 0.05 ent�o existe uma diferen�a est�tistica entre os grupos

#Sem intera��o
res.aov2 <- aov(len ~supp + dose, data = ToothGrowth)
str(ToothGrowth)
summary(res.aov2)

head(ToothGrowth)

#Com intera��o( se o valor P da intera��o for menor do que 0.05 ent�o existe intera��o)
res.aov3 <- aov(len ~supp*dose, data = ToothGrowth)
summary(res.aov3)

#Executar o teste de post-hoc (tukey)
#Se P menor do que 0.05 ent�o as m�dias s�o distintas

TukeyHSD(res.aov3)






########################################
# ANOVA de fator com medidas repetidas #
########################################

#*Vamos fazer um exemplo executando a ANOVA de um fator com m�didas repetidas
#*nos dados NotasProfessores_long. Esse dataset cont�m as notas de trabalhos
#*de alunos dadas por diferentes professores.
#*O que queremos saber � se os professores interferem ou n�o nas notas dos alunos.
#*Note que os grupos s�o pareados, ou seja a avalia��o foi realizada nos mesmos sujeitos

#Hipotese nula: As m�dias da vari�vel resposta (nota) correspondentes a cada n�vel
#               do fator (professor) s�o iguais.

#Hipotese Alternativa : Pelo menos uma das m�dias � diferente das demais

prof <- read.csv2("NotasProfessores_long.csv")

#Verificar a Estrutura do vetor
str(prof)


#Alterando o vari�vel ID para fator

prof$ID <- as.factor(prof$ID)


#Plotar m�dias

plotmeans(Nota ~Professor,prof,main = "Plot Means")

##########################
# Verificar Pressupostos #
##########################

#checando se os dados est�o balanceados

table(prof$Nota,prof$Professor)


#Normalidade

prof %>%
  group_by(Professor) %>%
  shapiro_test(Nota)


#Verificando a exist�ncia de outliers
prof %>%
  group_by(Professor) %>%
  identify_outliers(Nota)


#Esferacidade
#Esse resultado ser� mostrado quando executarmos a ANOVA de um fator
# com medidas repetidas

##################
# Executar Anova #
##################


prof.aov <- ezANOVA(data = prof,
                    dv = Nota,
                    wid = ID,
                    within = Professor,
                    detailed = T,
                    type = 3)
print(prof.aov)

#se o valor de P � menor que 0.05 significa que a esfericidade foi violada 
#(N�o usar os dados antiores)


#*Como a esericidade foi violada, ent�o a interpreta��o da etapa anterior �
#*descartada e precisamos considerar o resultado da anova com a esferificade
#*corrigida ($`Sphericity Corrections`)


#*Como epsilon (Gge) da corre��o Greenhouse-Geissere menor  que 0.75,
#*ent�o usamos o valor de p corrigifo (p[GG] p[GG]) para interpretar se existem
#*diferenas significativas entre os grupos

#Como p[GG] � menor do que 0.05 ent�o rejeitamos a hipotese nula


#Executar o teste de post-hoc (teste t emparelhado com corre��o de Bonferroni)


pairwise.t.test(prof$Nota, prof$Professor,
                p.adj = "bonferroni",
                paired = T)



#####################
# Teste de Friedman #
#####################

#*Para ilustar esse teste, iremos usar um conjunto de dados que mostra a
#*Avalia��o de 3 vinhos por um conjunto de participantes
#*como cada participante atribuiu uma nota para cada vinho (1-7)
#*usaremos esse teste de Friedman para determinar se as notas diferem entre os vinhos


#Hipote nula: as medianas da variavel resposta (Taste) correspondente a cada nivel
#             do fator (Wine) s�o iguais

#Hipotese alternativa: pelo menos uma das medianas � diferente das demais

#Carregar dados

WineTasting <- data.frame(
  Taste = c(5.40,5.50,5.55,
            5.85,5.70,5.75,
            5.20,5.60,5.50,
            5.55,5.50,5.40,
            5.90,5.85,5.70,
            5.45,5.55,5.60,
            5.40,5.40,5.35,
            5.45,5.50,5.35,
            5.25,5.15,5.00,
            5.85,5.80,5.70,
            5.25,5.20,5.10,
            5.65,5.55,5.45,
            5.60,5.25,5.45,
            5.05,5.00,4.95,
            5.50,5.50,5.40,
            5.45,5.55,5.50,
            5.55,5.55,5.35,
            5.45,5.50,5.55,
            5.50,5.45,5.25,
            5.65,5.60,5.40,
            5.70,5.65,5.55,
            6.30,6.30,6.25),
  Wine = factor(rep(c("Wine A", "Wine B", "Wine C"), 22)),
  Taster = factor(rep(1:22, rep(3,22))))

#Verificar estrutura do dataframe

str(WineTasting)


#Plotar Mediana

boxplot(Taste~Wine,WineTasting)


#Normalidade (N�o segue uma distribui��o normal pois o valor de p � menor do que
# 0.05, significa que n�o pode utilizar ANOVA com medidas repetidas)

WineTasting %>%
  group_by(Wine) %>%
  shapiro_test(Taste)

################################
# Executar o Teste de Friedman #
################################

friedman.test(y=WineTasting$Taste,groups = WineTasting$Wine,
              blocks = WineTasting$Taster)


# Executar o teste de post-hoc (teste  de Nemenyi com corre��o de Bonferroni)
#P maior do que 0,05 as medianas s�o iguais

frdAllPairsNemenyiTest(WineTasting$Taste,
                       WineTasting$Wine,
                       WineTasting$Taster,
                       p.adjust.methods = "bonferroni")
