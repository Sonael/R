#if

x <- -5

if(x < 0)
{
  print("Numero Positivo")
}


y <- c("Rural", "é", "Maravilhosa")


if("rural" %in% y)
{
  print('Rural was found in the first time')
}else if("Rural" %in% y)
{
  print("Rural was found in the second time")
}else
{
  print("Rural not found")
}


#operador ternario

a <- c(5,7,2,9)

ifelse(a %% 2 == 0,"even","odd")
