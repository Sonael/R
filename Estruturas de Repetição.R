#while

i <- 1

while(i < 6)
{
  print(i)
  i = i + 1
}


#for

for (k in 1:1) {
  print(k)
}


a <- c(5,7,2,9)

for (numeros in a) {
  print(numeros)
}


saida <- vector("double", ncol(airquality))

for (i in seq_along(airquality)) {
  saida[i] <- mean(airquality[,i], na.rm = T)
}


#calcule a media das colunas 5 e 6 de airquality


saida <- vector()

for(i in 5:6)
{
  saida <- cbind(saida, mean(airquality[,i], na.rm = T))
}


#repeat


x <- 1

repeat{
  print(x)
  x <- x+1
  if(x == 6)
  {
    break
  }
}