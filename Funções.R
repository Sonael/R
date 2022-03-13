subtracao <- function(x,y)
{
  return(x-y)
}

subtracao(15,20)

subtracao(y = 15,x = 20)


#Criando parametros padrões


subtracao <- function(x,y = 100)
{
  return(x-y)
}

subtracao(50)
subtracao(50,200)


#definindo variavéis com escopo global

subtracao <- function(x,y)
{
  y <<- y
  return(x-y)
}

subtracao(20,10)
y


#Usando o Argumento '...'

addpercent <- function(x, mult = 100, ...)
{
  percent <- round(x*mult, ...)
  paste(percent, "%",sep = "")
}


addpercent(c(0.1556, 0.3333,0.8,56),digits = 2)

