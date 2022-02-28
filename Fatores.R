#alterando o 4 elemento do fator x para "união estável"


#criando um fator
x = factor(c("solteiro", "casado", "casado", 'solteiro'))

#definindo os leveis do fator
x <- factor(x, levels = c("solteiro", "casado", "divorciado"))

x[2] = "solteiro"

#adcionando mais um level ao fator
levels(x) = c(levels(x), "viuvo")

x[3] = "viuvo"


#adcionando mais um level ao fator
levels(x) = c(levels(x), "união estável")

x[4] = "união estável"

levels(x) = c(levels(x), "não casado")

#alterando toda uma categoria de leveis
levels(x)[1] <- "não casado"


