aux_1 <- 10

aux_2 <- 15

aux_3 <- 5


ls()


rm(aux_2)

rm(list = ls())

#função soma 
soma <- sum(1,2,3)
soma

#função média
media <- mean(10,10,10)
media


F == FALSE


(1:5)^2

sum((10:20)^2)



x <- 133
y <- 36

z <- sum(x,y)

raiz <- sqrt(z)

logaritmo <- log(raiz)


round(logaritmo, 0)

round(log(sum(0, 1, 1, 2, 3)),digits = 3)

função <- function(x) { return(x^3 + x^2 + x) }

função(sin(2)+2)


expressão <- deriv(sin(2)+2,"x")

round(2.90929742682568,2)




Energia <- function(m,c){ 
  
  return(m*c^2)
  
  }

energia <- Energia(10, 300000000)

round(log(energia),2)


v <- c(2,5,7,8,9)

media <- função(v)

mean(media)


fact10 <- prod(10:1)

round(log10(fact10),2)
  