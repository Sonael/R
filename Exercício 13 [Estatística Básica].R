5+7+12+15+10

c <- c(5,7,12,15,10)


mean(5,7,12,15,10)


var(c)


2/length(c)


#*Voc� deseja estimar a renda m�dia dos ex-alunos da Ruralinda; admite-se 
#*que esta popula��o seja infinita. Quantos valores de renda devem ser 
#*tomados, se o voc� deseja ter um n�vel de confian�a 90% e um erro m�ximo 
#*de 300 reais? Suponha que saibamos, por um estudo pr�vio, que para tais 
#*rendas, ?? = R$4250,00. Use apenas duas casas decimais para submeter sua 
#*resposta (sem arredondamento). Ex.:123.239586 -> 123.23.


sd <- 4250

erro <- 300 

nc <- (1-0.9)/2


n <- ((qnorm(nc,lower.tail = F)*sd)/erro)^2


#*Suponha que a vari�vel escolhida num estudo seja o peso dos alunos da 
#*Ruralinda e que a popula��o � composta de 1500 alunos. Pelo um estudo  
#*pr�vio dos pesos, o desvio-padr�o � de 5 kg. Admitindo-se um n�vel de 
#*confian�a de 95,5% e um erro amostral de 1,5 kg, calcule o tamanho da 
#*amostra para estimar o peso m�dio dos alunos da Ruralinda. Use apenas 
#*duas casas decimais para submeter sua resposta (sem arredondamento). 
#*Ex.:123.239586 -> 123.23.


sd <- 5

N <- 1500

erro <- 1.5

nc <- (1-0.95)/2


n <- (qnorm(nc,lower.tail = F)^2*sd^2*N)/((erro^2*(N-1)))+(qnorm(nc,lower.tail = F)^2*sd^2)