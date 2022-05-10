install.packages("nortest")

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
#Teste T para duas médias indenpendentes

#Nivel de significancia 0,05

x <- c(8.8,8.4,7.9,8.7,9.1,9.6)
y <- c(9.9,9.0,11.1,9.6,8.7,10.4)
nc <- 0.95
ns <- 1-nc


aux <- t.test(x,y,alternative = "two.sided", conf.level = nc, var.equal = T)


#Verificação da hipotese nula

verificaHO(aux$p.value,ns) 


# Verificar se amostras seguem uma distribuição normal (tem que ser maior que o nivel de significancia pra n ser nulo a hipotese)

shapiro.test(x)

shapiro.test(y)

verificaNormalidade(x,ns)
verificaNormalidade(y,ns)

#verificar se as variancias são homogênias (tem que ser menor do que o nivel de significancia pra n ser nulo a hipotese)

var.test(x,y)

verificaVariancias(x,y,ns)


# Se as variaveis estiverem em um data frame, é possivel usar a notação d fórmula no formato y~x

install.packages("yarrr")

library(yarrr)


piratas <- t.test(formula = tattoos~eyepatch,
       data = pirates,
       alternative = "less",
       var.equal = T)

verificaHO(piratas$p.value)

verificaNormalidade(pirates$tattoos[pirates$eyepatch == 0])
verificaNormalidade(pirates$tattoos[pirates$eyepatch == 1])

#comparar o número médio de tatuagem entre piratas de 29 a 30 anos


piratas20a30 <- t.test(formula = tattoos~eyepatch,
                  data = pirates,
                  subset = age %in% c(29,30),
                  alternative = "two.sided",
                  var.equal = T)

verificaHO(piratas20a30$p.value)

verificaNormalidade(pirates$tattoos[pirates$age == 29])
verificaNormalidade(pirates$tattoos[pirates$age == 30])




# Teste T para duas amostras relacionadas


antes <- c(37.5,36,39,38,37.8,38.5,39.3)
depois <- c(37.8,36.4,37.6,37.2,36.9,37.7,38)

temperatura <- t.test(antes,depois,paired = T,
       var.equal = T)


verificaHO(temperatura$p.value)

verificaNormalidade(antes)

verificaNormalidade(depois)

verificaVariancias(antes, depois)



#Teste U de Mann-Whitney

# Ele é usado para verificar se dois grupos independentes são provenientes de uma mesma população

# Em caso de amostras pareadas (relacionadas) usa o Teste de Wilcoxon


# a verificação de normalidade deu menor que o nivel de significancia ent n podemos usar o teste T
verificaNormalidade(pirates$tattoos[pirates$eyepatch ==0])
verificaNormalidade(pirates$tattoos[pirates$eyepatch ==1])

piratas <- wilcox.test(tattoos~eyepatch,data = pirates)


verificaHO(piratas$p.value)
