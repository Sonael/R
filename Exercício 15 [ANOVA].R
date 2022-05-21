aux <- data.frame(Branco = c(6,8,2,4,6),
                  Negro = c(4,1,5,2,NA),
                  Hispânico = c(7,3,5,4,6),
                  Asiático = c(8,3,5,1,7))


mean(aux$Branco)
mean(aux$Negro,na.rm = T)
mean(aux$Hispânico)
mean(aux$Asiático)

str(PlantGrowth)

aux <- data.frame(Linhagem = c("pri",
                               "pri",
                               "pri",
                               "pri",
                               "pri",
                               "pri",
                               "pri",
                               "pri",
                               "pri",
                               "seg",
                               "seg",
                               "seg",
                               "seg",
                               "seg",
                               "seg",
                               "seg",
                               "seg",
                               "seg",
                               "ter",
                               "ter",
                               "ter",
                               "ter",
                               "ter",
                               "ter",
                               "ter",
                               "ter",
                               "ter",
                               "Quar",
                               "Quar",
                               "Quar",
                               "Quar",
                               "Quar",
                               "Quar",
                               "Quar",
                               "Quar",
                               "Quar"),
                  Teor = c(5.9,
                           6.8,
                           6.4,
                           7.0,
                           6.6,
                           7.7,
                           7.2,
                           6.9,
                           6.2,
                           6.9,
                           9.0,
                           6.6,
                           8.1,
                           9.3,
                           9.2,
                           8.6,
                           NA,
                           NA,
                           4.9,
                           5.5,
                           4.6,
                           4.5,
                           NA,
                           NA,
                           NA,
                           NA,
                           NA,
                           5.3,
                           5.6,
                           5.5,
                           5.1,
                           6.2,
                           5.8,
                           5.8,
                           NA,
                           NA))






aux$Linhagem <- as.factor(aux$Linhagem)

str(aux)

aux.aov <- aov(formula = Teor~Linhagem,
                 data = aux)
summary(aux.aov)

TukeyHSD(aux.aov)

0.0176461 > 0.05
0.0014326 > 0.05
0.0008811 > 0.05
0.0000018 > 0.05
0.3443290 > 0.05
0.0000004> 0.05