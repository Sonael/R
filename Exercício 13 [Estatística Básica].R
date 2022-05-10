5+7+12+15+10

c <- c(5,7,12,15,10)


mean(5,7,12,15,10)


var(c)


2/length(c)


#*Você deseja estimar a renda média dos ex-alunos da Ruralinda; admite-se 
#*que esta população seja infinita. Quantos valores de renda devem ser 
#*tomados, se o você deseja ter um nível de confiança 90% e um erro máximo 
#*de 300 reais? Suponha que saibamos, por um estudo prévio, que para tais 
#*rendas, ?? = R$4250,00. Use apenas duas casas decimais para submeter sua 
#*resposta (sem arredondamento). Ex.:123.239586 -> 123.23.


sd <- 4250

erro <- 300 

nc <- (1-0.9)/2


n <- ((qnorm(nc,lower.tail = F)*sd)/erro)^2


#*Suponha que a variável escolhida num estudo seja o peso dos alunos da 
#*Ruralinda e que a população é composta de 1500 alunos. Pelo um estudo  
#*prévio dos pesos, o desvio-padrão é de 5 kg. Admitindo-se um nível de 
#*confiança de 95,5% e um erro amostral de 1,5 kg, calcule o tamanho da 
#*amostra para estimar o peso médio dos alunos da Ruralinda. Use apenas 
#*duas casas decimais para submeter sua resposta (sem arredondamento). 
#*Ex.:123.239586 -> 123.23.


sd <- 5

N <- 1500

erro <- 1.5

nc <- (1-0.95)/2


n <- (qnorm(nc,lower.tail = F)^2*sd^2*N)/((erro^2*(N-1)))+(qnorm(nc,lower.tail = F)^2*sd^2)