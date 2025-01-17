Bebidas <- c("Brahma", "Cacildis", "Heineken", "Skol", "Corona",
             "Bud Light", "DeBron", "Budweiser", "Ek�ut", "Snow Beer", "Bav�ria", "Bohemia", "Crystal", "Kaiser", "Itaipava",
             "Schin", "Antarctica", "Amstel", "Colorado", "Capunga")
set.seed(100)

precos <- runif (20, min = 2, max = 10)
vendas <- runif (20, min = 20, max = 100)
estoque <- sample (c(20:50), size = 20, replace = TRUE)

dataset_loja <- data.frame (id_produto = c(1:20), Bebidas = Bebidas,
                            preco = precos, total_vendas = vendas,
                            total_estoque = estoque)
head(dataset_loja)



#*Fun��o Apply(): aplica uma fun��o a um array(matriz ou data frame) a partir de 
#*uma margem especificada
#*A margem que a fun��o aplica �: 1 para linhas ou 2 para colunas

apply(X = dataset_loja[,-c(1,2)],MARGIN = 2,FUN = sum)



#*Fun��o Lapply(): Similar ao apply, por�m � aplicav�l a outros objetos como listas
#*vetore e data frames. Al�m disso, retorna sempre uma lista obrigatoriamente

lapply(X = dataset_loja[,-c(1,2)],FUN = sum)


#*Fun��o Sapply(): Similar ao Lapply, por�m a saida geralmente � simplificada
#*sendo apenas um vetor

sapply(X = dataset_loja[,-c(1,2)], FUN = sum)


#*Como fa�o pra obter as classes ou o tamanho das colunas usando o Sapply?

sapply(X = dataset_loja, FUN = class)

sapply(X = dataset_loja, FUN = length)



#*Fun��o Tapply(): Fun��o com o objetivo de aplicar fun��es em grupos diferentes
#*ex.: Fator


dataset_loja$fornecedores <- sample(c("Fornecedor 1","Fornecedor 2", "Fornecedor 3",
                                      "Fornecedor 4"),size = 20,replace = TRUE)


tapply(X = dataset_loja[,"preco"],INDEX =  dataset_loja[,"fornecedores"],FUN = mean)



#*Fun��o Mapply(): Esta � uma vers�ao multivariada da sapply e recebe como argumento
#* uma fun��o e um conjunto de argumentos. A fun��o � aplicada em cada um dos
#*argumentos sequencialmente

mapply(FUN = function(x,y,z) { (x*y)+z},dataset_loja[,c("preco")],
       dataset_loja[,c("total_estoque")],dataset_loja[,c("total_vendas")])



#exemplos utilizando o Mapply()

aux <- c("Eu", "amo", "a rural")


mapply(paste, aux, "**",sep="")

mapply(rep,"rural",5:1)
