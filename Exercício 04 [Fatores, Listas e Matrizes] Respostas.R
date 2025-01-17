#*Um fator tamb�m pode ser gerado usando a fun��o gl(). Qual o comando cria um
#*fator com 100 repeti��es tanto para"M" quanto para "F" ? Note que o comando deve
#*ser submetido no seguinte formato: gl(x,k,labels = z). OBS.: Ao submeter o
#*comando, retire todos os espa�o em branco.

gl(2,100,labels=c("M","F"))



#*Crie o fator drinks <- factor(c("beer","beer","wine","water")). Depois, submeta
#*apenas o comando em R para calcular a propor��o de cervejas (beer) no objeto
#*fator de bebidas (drinks). � obrigat�rio o uso da fun��o mean para calcular a 
#*propor��o. OBS.: Ao submeter o comando, retire todos os espa�o em branco.

mean(drinks=="beer")



#*Crie o fator drinks <- factor(c("beer","beer","wine","water")). Depois, altere
#*o primeiro n�vel do fator com o seguinte 
#*comando: levels(drinks)[1] <- "water". Qual o fator resultante quando acessar 
#*os elementos do mesmo?

#water water wine water


#*Considere os vetores: nomes=[Jo�o, Paula, Maria, Ingrid, Jos�, Marcos], 
#*pesos=[80, 65, 70, 58, 78, 70] e alturas=[1.70, 1.66, 1.65, 1.60, 1.76, 1.70].
#*Crie uma lista com esses vetores chamada de lista_pessoas. Depois, crie um
#*quarto objeto chamado IMC de acordo coma equa��o IMC=pesos/alturas^2. Por fim,
#*adicione o vetor IMC a lista_pessoas (ao final da lista) e responda as quest�es
#*abaixo:


#*Qual o comando para acessar o primeiro nome contido no primeiro elemento da
#*lista (lista_pessoas)? OBS.: Ao submeter o comando, retire todos os espa�o em
#*branco

lista_pessoas[[1]][1]


#*Quais s�o as classes dos objetos na lista?

# V Character
# V Num�rico
#L�gico
#Complexo
#Inteiro

#*O que retorna o seguinte comando lista_pessoas[[4]][3]?

#27.68166
#23.58833
# V 25.71166
#22.65625
#25.18079
#24.22145



#*A partir do dateset 'airquality', crie uma vari�vel 'lista' com o seguinte 
#*comando: lista<-lapply(airquality, function(x){mean(x)}). A fun��o lapply() 
#*retorna um objeto do tipo lista com os valores das m�dias de cada uma das 
#*colunas do dataset 'airquality'. Usando o RStudio, analise o dataset 
#*'airquality' e a vari�vel 'lista'. Em seguida, escreva o comando que apenas 
#*apresenta a m�dia das temperaturas contida na vari�vel 'lista' .

lista$Temp


#*Para responder as quest�o abaixo, fa�a download do arquivo dispon�vel em 
#*https://www.dropbox.com/s/luxinhu8d1hmc1j/chuvas.RData?dl=1 e mova-o para 
#*o seu diret�rio. Em seguida leia-o com o comando load("chuvas.RData"). 
#*A matriz chuvas possui dados (em mm) sobre precipita��es em 100 munic�pios 
#*do Brasil, durante um per�odo de 30 dias. Os munic�pios est�o representados 
#*em c�digos atrav�s das linhas e os dias atrav�s das colunas. Diante de tais 
#*dados,resolva as quest�es abaixo.


#Qual a m�dia do volume de chuvas do per�odo observado?

#4.1
# V 5.049933
#30.2
#504.9933
#0


#Qual munic�pio teve o maior volume de chuvas considerando os 30 dias observados?

#"mun_59"
# V "mun_60"
#"mun_61"
#"mun_62"
#"mun_63"


#Considerando o volume de todos os munic�pios observados, em qual dia menos choveu?

#"dia_10"
#"dia_11"
# V "dia_12"
#"dia_13"
#"dia_14"

T <- colSums(chuvas)
names(T[T==min(colSums(chuvas))])



#*Quais comandos abaixo calculam o volume de chuvas do munic�pio 81 (mun_81) nos 
#*primeiros 10 dias observados?

# V aux<-chuvas["mun_81" , ]; aux<-sum(aux[1:10])

# V aux<-chuvas[81 , ]; aux<-sum(aux[1:10])

# V aux<-chuvas[81 , ]; aux<-sum(aux[seq(1,10,1)])

#aux<-chuvas["mun_81" ]; aux<-sum(aux[1:10])

# V aux<-chuvas["mun_81" , ]; aux<-sum(aux[c(1:10)])