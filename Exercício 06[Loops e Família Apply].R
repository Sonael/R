View(iris)

mediaSenpal.len <- mean(iris$Sepal.Length)

mediaSenpal.wid <- mean(iris$Sepal.Width)

mediaPetal.len <- mean(iris$Petal.Length)

mediaPetal.wid <- mean(iris$Petal.Width) 



for (i in 1:4) {
  next
}



#*Função Mapply(): Esta é uma versçao multivariada da sapply e recebe como argumento
#* uma função e um conjunto de argumentos. A função é aplicada em cada um dos
#*argumentos sequencialmente

mapply(FUN = function(x,y,z) { (x*y)+z},dataset_loja[,c("preco")],
       dataset_loja[,c("total_estoque")],dataset_loja[,c("total_vendas")])



teste <- function(x)
{
  return( rep(x, c(1:10)))
}


teste(c("Rural","amo"))

mapply(rep,c("Rural","Amo"),times= 10:1)





for(i in 1:length(1:3))
{
  for(j in 1:10)
  {
    print(c(j,i))
  }
}


student.df = data.frame (nome= c ("Sue", "Eva", "Henry", "Jan"), sexo= c ("f", "f", "m", "m"), anos= c (21,15,17,19))


student.df$menor<-ifelse(student.df$sexo=="m"&student.df$anos<18,"V","F")



View(USArrests)


lapply(USArrests,FUN = sum)

#########################################3


x = 0 
a = 0
b = -5

if (a > 0) {
  if(b>0){
    x = x + 5
  }else if( a > 5){
    x = x+4
  }else{
    x = x + 3
  }
}else
{
  x = x+2
}

print(x)


x = 0

while (x < 100){
  x = x+2
}

print(x)
