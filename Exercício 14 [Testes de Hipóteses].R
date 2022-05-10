verificaHO <- function(pvalue,ns=0.05)
{
  if(pvalue > ns)
  {
    print("Aceita hipotese nula")
  }
  else
  {
    print("Rejeita a hipotese nula")
  }
}


verificaNormalidade <- function(x,ns=0.05)
{
  if(length(x) <= 50)
  {
    x <- shapiro.test(x)
  }
  else
  {
    require(nortest)
    x <- ad.test(x)
  }
  
  if(x$p.value>ns)
  {
    print("os dados seguem uma distribuição normal")
  }
  
  else
  {
    print("Os dados não seguem uma distribuição normal")
  }
}

verificaVariancias <- function(x,y,ns=0.05)
{
  x <- var.test(x,y)
  if(x$p.value > ns)
  {
    print("As variancias são homogeneas")
  }
  else
  {
    print("As variancias não são homogeneas")
  }
}

##########################################################################################################################


antes <- c(75,50,50,60,50,70)
depois <- c(85,75,70,65,60,90)
nc <- 0.95
ns <- 1-nc


verificaNormalidade(antes)
verificaNormalidade(depois)

verificaVariancias(antes,depois)



aux <- t.test(antes,depois,alternative = "two.sided", conf.level = nc, var.equal = T)

verificaHO(aux$p.value)

##########################################################################################################################

suplemento <- c(15,18,20,14,16,19)
placebo <- c(16,12,15,15,14,18)

verificaNormalidade(suplemento)
verificaNormalidade(placebo)

verificaVariancias(suplemento,placebo)

aux<- t.test(placebo,suplemento,var.equal = T,conf.level = nc,alternative = "two.sided")

verificaHO(aux$p.value)

##########################################################################################################################


View(pirates)
verificaNormalidade(airquality$Ozone[airquality$Month == 5])
verificaNormalidade(airquality$Ozone[airquality$Month == 6])


aux <- wilcox.test(formula = Ozone~Month,
              data = airquality,
              subset = Month %in% c(5,6),
              alternative = "two.sided",
              var.equal = T)


str(airquality)

