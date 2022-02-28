xx <- c(TRUE, 2)


x <- c(1:4)
y <- c(2:3)

x*y



tabela <- matrix(c(30,155,50,1829,75,6,23,8,274,12,42,102,38,2149,97,38,173,71,1554,70),5,4)

rownames(tabela) <- c("abdominais em 2 min","salto em extensão (cm)","suspensão braços flexionados (seg)","correr/andar em 12 min (m)","conhecimento desportivo")

colnames(tabela) <- c("Média", "Desvio Padrão", "Maria", "Joana")

#beber.n <- (beber-mean(beber))/sd(beber)

maria <- (tabela[,3]-mean(tabela[,3]))/sd(tabela[,3])
Joana <- (tabela[,4]-mean(tabela[,4]))/sd(tabela[,4])

media <- (maria+Joana)/2

mean(maria) > mean(Joana)

load("vetor.RData")

vetor01

summary(vetor01)

sd(vetor01, na.rm = TRUE)

321/150000


length(vetor01[vetor01 > 7.00 & vetor01 < 8.00])-321

length(vetor01[vetor01 > 9.00 | vetor01 < 1.00])-321


vetor01.teste <- vetor01[!is.na(vetor01)]

15000-321

vetor01.teste <- !is.na(vetor01)

vetor01[!is.na(vetor01)] -> vetor01

vetor01 <- vetor01[-which(is.na(vetor01))]


vetor01 <- vetor01[which(is.na(vetor01))]
