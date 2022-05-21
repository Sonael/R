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

#*Para Executarmos a ANOVA fator 1, iremos usar o dataset PlantGrowth. Esse dataset contém
#*o peso das plantas obtidos usando 3 tipos de tratamento distintos. O que queremos saber 
#*é  se os tratamentos afetam ou não nos pesos das plantas


#Hipotese nula : As médias dos pesos (variavel weight) correspondentes a cada tratamento 
#(group) são iguais

#Hipotese alternativa : pelo menos uma das médias é difetente das demais


#Verificar a estutura dos dataframe

str(PlantGrowth)

#Plotar médias

plotmeans(weight ~ group, PlantGrowth,main = "Plot means")

##########################
# Verificar Pressupostos #
##########################

#Independencia
#As amostras devem ser coletadas de forma independente uma das outras

#Normalidade(Valor de P maior de que 0.05 é Normal)
PlantGrowth %>%
  group_by(group)%>%
  shapiro_test(weight)


#Variancias Homogeneas (Valor de P maior de que 0.05 é homogênea)

leveneTest(weight ~group, data = PlantGrowth)


#Verificando a existência de outliers (continuar se n existem outliers extremos)

PlantGrowth %>%
  group_by(group) %>%
  identify_outliers(weight)


####################
# Executar a ANOVA #
####################

#Se o valor de P for menor do que 0.05 então rejeita a hipotese nula

plant.aov <- aov(formula = weight~group,
                 data = PlantGrowth)


summary(plant.aov)


#Executar o teste de post-hoc (tukey)
#*Verificar quais dessas comparações nao são iguais (Se o valor é maior que 0.05
#* é pq n existe diferença)

TukeyHSD(plant.aov)



######################
# ANOVA de 2 Fatores #
######################

#*Para executarmos a ANOVA de 2 Fatores, iremos utilizar o dataset ToothGrowth
#*o que queremos saber é se as doses (variavel dose) e/ou suplementos (variavel supp)
#*afetam ou não no crescimento dos dentes das cobaias (variavel len)
#*ou seja, queremos saber se as médias dos tamanhos dos deentes corespendente a cada
#*dose e suplemente são iguais ou não. Além disso gostariamos de saber se existe interação
#*entre supp e dose


#Hipotes Nula
# 1 - As médias dos grupos do fator supp são iguais
# 2 - As médias dos grupos do fator dose são iguais
# 3 - Não há interação entre os fatores supp e dose

#HIpotese Alternativa
# 1 - A hipotese altenativa para os casos 1 e 2 é que as médias são diferentes
# 2 - A hipotese alternativa  para o caso 3 é que existe uma interação entre supp e dose


#Verificar estrutura do dataframe

str(ToothGrowth)


# Alterando a variavel dose para fator

ToothGrowth$dose <- factor(ToothGrowth$dose)

#Plotar médias

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

#Variância homogêneas
leveneTest(len ~ supp*dose, data = ToothGrowth)

#Verificando a existência de outliers
ToothGrowth %>%
  group_by(dose, supp) %>%
  identify_outliers(len)


#Checandos se os dados estão balaceados

table(ToothGrowth$supp, ToothGrowth$dose)


##############################
# Executar a ANOVA 2 fatores #
##############################

# se P for menor do que 0.05 então existe uma diferença estátistica entre os grupos

#Sem interação
res.aov2 <- aov(len ~supp + dose, data = ToothGrowth)
str(ToothGrowth)
summary(res.aov2)

head(ToothGrowth)

#Com interação( se o valor P da interação for menor do que 0.05 então existe interação)
res.aov3 <- aov(len ~supp*dose, data = ToothGrowth)
summary(res.aov3)

#Executar o teste de post-hoc (tukey)
#Se P menor do que 0.05 então as médias são distintas

TukeyHSD(res.aov3)






########################################
# ANOVA de fator com medidas repetidas #
########################################

#*Vamos fazer um exemplo executando a ANOVA de um fator com médidas repetidas
#*nos dados NotasProfessores_long. Esse dataset contém as notas de trabalhos
#*de alunos dadas por diferentes professores.
#*O que queremos saber é se os professores interferem ou não nas notas dos alunos.
#*Note que os grupos são pareados, ou seja a avaliação foi realizada nos mesmos sujeitos

#Hipotese nula: As médias da variável resposta (nota) correspondentes a cada nível
#               do fator (professor) são iguais.

#Hipotese Alternativa : Pelo menos uma das médias é diferente das demais

prof <- read.csv2("NotasProfessores_long.csv")

#Verificar a Estrutura do vetor
str(prof)


#Alterando o variável ID para fator

prof$ID <- as.factor(prof$ID)


#Plotar médias

plotmeans(Nota ~Professor,prof,main = "Plot Means")

##########################
# Verificar Pressupostos #
##########################

#checando se os dados estão balanceados

table(prof$Nota,prof$Professor)


#Normalidade

prof %>%
  group_by(Professor) %>%
  shapiro_test(Nota)


#Verificando a existência de outliers
prof %>%
  group_by(Professor) %>%
  identify_outliers(Nota)


#Esferacidade
#Esse resultado será mostrado quando executarmos a ANOVA de um fator
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

#se o valor de P é menor que 0.05 significa que a esfericidade foi violada 
#(Não usar os dados antiores)


#*Como a esericidade foi violada, então a interpretação da etapa anterior é
#*descartada e precisamos considerar o resultado da anova com a esferificade
#*corrigida ($`Sphericity Corrections`)


#*Como epsilon (Gge) da correção Greenhouse-Geissere menor  que 0.75,
#*então usamos o valor de p corrigifo (p[GG] p[GG]) para interpretar se existem
#*diferenas significativas entre os grupos

#Como p[GG] é menor do que 0.05 então rejeitamos a hipotese nula


#Executar o teste de post-hoc (teste t emparelhado com correção de Bonferroni)


pairwise.t.test(prof$Nota, prof$Professor,
                p.adj = "bonferroni",
                paired = T)



#####################
# Teste de Friedman #
#####################

#*Para ilustar esse teste, iremos usar um conjunto de dados que mostra a
#*Avaliação de 3 vinhos por um conjunto de participantes
#*como cada participante atribuiu uma nota para cada vinho (1-7)
#*usaremos esse teste de Friedman para determinar se as notas diferem entre os vinhos


#Hipote nula: as medianas da variavel resposta (Taste) correspondente a cada nivel
#             do fator (Wine) são iguais

#Hipotese alternativa: pelo menos uma das medianas é diferente das demais

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


#Normalidade (Não segue uma distribuição normal pois o valor de p é menor do que
# 0.05, significa que não pode utilizar ANOVA com medidas repetidas)

WineTasting %>%
  group_by(Wine) %>%
  shapiro_test(Taste)

################################
# Executar o Teste de Friedman #
################################

friedman.test(y=WineTasting$Taste,groups = WineTasting$Wine,
              blocks = WineTasting$Taster)


# Executar o teste de post-hoc (teste  de Nemenyi com correção de Bonferroni)
#P maior do que 0,05 as medianas são iguais

frdAllPairsNemenyiTest(WineTasting$Taste,
                       WineTasting$Wine,
                       WineTasting$Taster,
                       p.adjust.methods = "bonferroni")
