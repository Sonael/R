#criando uma matriz

A <- matrix(1:12,3,4)

#renomeando a matriz A

rownames(A) <- c("linha1", "linha2","linha3")

colnames(A) <- c("coluna1", "coluna2", "coluna3", "coluna4")


#acresentando linhas e colunas na matriz

coluna5 <- c(0,0,0)
linha4 <- c(1,1,1,1,1)

A=cbind(A, coluna5)
A= rbind(A,linha4)


#acessando elementos [linha, coluna]

A[4,3]




#acessar apenas a matriz 2x2 de A

A[1:2,1:2]


#acessar apenas valores maiores que 3

A[,]>3
A[A[,]>3]




#operações com matrizes

B <- matrix(9:1,3,3)
C<- matrix(1:9,3,3)

#adição
B+C

#multiplicação
B%*%C

#transposta
aperm(B)
t(B)

#inversa
solve(B)

#determinante

det(C)

