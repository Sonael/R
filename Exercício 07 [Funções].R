y <- 5

mult <- function(x)
{
  return(x*y)
}

mult(10)



prisoes <- function(estados,tiposPrisoes)
{
  if(estados %in% )
}

"Texas" %in% row.names(USArrests)



##########################



minhasNotas_1 <- function(Exe_1=0,VA_1=0,Exe_2=0,Proj=0,VA_2=0,VA_3=0,Opt=1,
                          threshold=7)
{
  
  VA1 <- (((mean(Exe_1,na.rm = T)*5) + (VA_1*5))/10)
  
  VA2 <- (((mean(Exe_2,na.rm = T)*2) + (VA_2*5) + (Proj*3))/10)
  
  notas <- c(VA1,VA2,VA_3)

  if(Opt == 1)
  {
    media <- VA1
    print(media)
    if(media > threshold)
    {
      print("acima da media")
    }
    else{
      print("Abaixo da m�dia")
    }
  }
  else if(Opt == 2)
  {
    media <- VA2
    print(media)
    if(media > threshold)
    {
      print("acima da media")
    }
    else{
      print("Abaixo da m�dia")
    }
  }
  else if(Opt == 3)
  {
    media <- mean(VA_3)
    print(media)
    if(media > threshold)
    {
      print("acima da media")
    }
    else{
      print("Abaixo da m�dia")
    }
  }
  else if(Opt == 4)
  {
    menor <- min(notas)
    
    for(i in 1:length(notas))
    {
      if(notas[i] == menor)
        {
        notas_altas <- notas[-i]
        break
        }
    }
    media <- mean(notas_altas)
    print(media)
    if(media > threshold)
    {
      print("acima da media")
    }
    else{
      print("Est� na final")
    }
    
    
  }
  
}




menor <- min(c(1,1,3))

vetor <- c(1,2,3)

vetor[-"a"]
for(i in 1:length(vetor))
{
  if(vetor[i] == menor)
    numeros <- vetor[-i]
}

minhasNotas_1(Exe_1 = 1,VA_1 = 2,Exe_2 = 2,Proj = 7,VA_2 = 2,VA_3 = 4,Opt = 4,
              threshold = 6)


nota <- minhasNotas_1(Exe_1=c(10,9,7,5,10,4,NA,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(7,5), VA_2=7, VA_3=9, Opt=1, threshold=8)


minhasNotas_1(Exe_1=c(10,9,7,5,NA,4,5,6,7,8,NA), VA_1=2, Exe_2=c(10,5.7,7.8,NA), Proj=4, VA_2=7, VA_3=9, Opt=2, threshold=5)


minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(8,5,7,8), Proj=c(4,5), VA_2=7, VA_3=9, Opt=2, threshold=8)

minhasNotas_1(Exe_1=c(NA,NA,7.5,1,10,2,5,6,7,8,10), VA_1=4, Exe_2=c(7,11,8.8,5,7,8), Proj=4, VA_2=7, VA_3=9, Opt=4, threshold=7)

minhasNotas_1(Exe_1=c(10,9,7,5,10,4,5,6,7,8,10), VA_1=8, Exe_2=c(6,8,9,8,5,7,8), Proj=7, VA_2=7, VA_3=9, Opt=4, threshold=8)

