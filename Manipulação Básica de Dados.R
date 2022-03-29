#importando dados

#Lendo um arquivo TXT

V1 <- read.table("Pica-pau.txt", header = TRUE, sep = "",dec = ".")


sum(V1$especie == "verde")


#checagem e limpeza de dados

Caracol_data <- read.csv(file = "Snail_feeding.csv",
                         header = TRUE,
                         strip.white = T,
                         na.strings = "")

str(Caracol_data)


#removendo colunas extras

Caracol_data <- Caracol_data[,1:7]


#checandos os niveis

Caracol_data$Sex <- factor(Caracol_data$Sex, levels = c("male","female", "female s", "Male", "males"))

levels(Caracol_data$Sex)

levels(Caracol_data$Sex)[3] <- "female"
levels(Caracol_data$Sex)[4] <- "male"
levels(Caracol_data$Sex)[5] <- "male"

Caracol_data$Size <- factor(Caracol_data$Size, levels = c("small","large"))

Caracol_data$Distance <- as.numeric(Caracol_data$Distance)

#atualizando os NAs

which(is.na(Caracol_data$Distance))

Caracol_data[682,"Distance"] <- 0.58

Caracol_data[755,"Distance"] <- 0.356452



#localizando e removendo dados duplicados

which(duplicated(Caracol_data))


index <- which(duplicated(Caracol_data))

Caracol_data <- Caracol_data[-index,]



#encontrando erros
summary(Caracol_data)


Caracol_data[which(Caracol_data$Depth > 2), ]

#substituindo o valor

Caracol_data[8,6] <- 1.62


#exportação de dados

write.csv(Caracol_data,
          file = "Caracol_data_checked.csv",
          row.names = FALSE)
