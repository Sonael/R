#alterando o 4 elemento do fator x para "uni�o est�vel"


#criando um fator
x = factor(c("solteiro", "casado", "casado", 'solteiro'))

#definindo os leveis do fator
x <- factor(x, levels = c("solteiro", "casado", "divorciado"))

x[2] = "solteiro"

#adcionando mais um level ao fator
levels(x) = c(levels(x), "viuvo")

x[3] = "viuvo"


#adcionando mais um level ao fator
levels(x) = c(levels(x), "uni�o est�vel")

x[4] = "uni�o est�vel"

levels(x) = c(levels(x), "n�o casado")

#alterando toda uma categoria de leveis
levels(x)[1] <- "n�o casado"


