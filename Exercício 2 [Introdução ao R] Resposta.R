#Escolha as op��es corretas: 

# V O R � case sensitive.
#Coment�rios no R se utiliza "%".
#� necess�rio definir os tipos das vari�veis no R.
#rm() lista os elementos da mem�ria.
#library() � usado para instalar pacotes.
# V O correto � usar "<-" para atribuir valores a uma vari�vel.



#A express�o F == FALSE, retorna:

# V TRUE
#FALSE



#Selecione as declara��es corretas:

#aux!
#1contador
# V teste_121
#B$
#c-ccc123
# V teste_


#Com rela��o a objetos e fun��es, escolha a resposta correta.

#Um escalar n�o � considerado um objeto no R.
#Fun��es n�o realizam processamentos.
#sum() n�o � uma fun��o no R.
# V O resultado de um teste estat�stico � considerado um objeto no R.
#Fun��es n�o possuem par�metros.


#*Dado que temos a seguinte soma: 10^2 + 11^2 + ... + 20^2, qual a express�o 
#*correspondente em R.


#(10:20)
#(10:20)^2
# V sum((10:20)^2)
#mul((10:20)^2)
#sum((10:20)*2)



#* Atribua o valor 133 para X e o valor 36 para Y. Em sequ�ncia, adicione a soma 
#* de X e Y a Z. Depois, calcule a raiz quadrada de Z e o logaritmo natural do 
#* resultado da raiz quadrada. Por fim, arredonde o resultado para zero d�gitos. 
#* Qual o valor resultante ? Note que a resposta � um n�mero inteiro.

3

x<-133
y<-36
z<-x+y
round(log(sqrt(z)), digits = 0)



#*Pesquise a respeito da "sequ�ncia de Fibonacci" (a sequ�ncia inicia com ZERO) e 
#*obtenha os cinco primeiros n�meros dessa sequ�ncia. Qual o logar�timo natural 
#*da soma desses cinco n�meros? (Observa��o: use a fun��o round() para arredondar 
#*a resposta de modo que ela tenha apenas tr�s casas decimais)


1.946

x<-sum(0,1, 1, 2, 3)
round(log(x), digits = 3)

#*Dada a fun��o f(x) = sin(x) + x. Calcule o valor da derivada de primeira ordem 
#*de f(x) quando x=2. (Observa��o: use a fun��o round() para arredondar a resposta 
#*de modo que ela tenha apenas tr�s casas decimais)

0.584

#Note que a derivada de primeira ordem de f(x) � 'f(x) = cos(x)+1.

round( cos(2)+1, digits = 3 )


#*Calcule o factorial de 10. Com o resultado em m�os, calcule o logaritmo de base 10
#*desse resultado. (Observa��o: use a fun��o round() para arredondar a resposta de 
#*modo que ela tenha apenas duas casas decimais)


6.56

round(log10(factorial(10)), digits = 2)


#*Suponha que a velocidade da luz seja c = 300000000 m/s. A equa��o da equival�ncia 
#*massa-energia de Einstein � dada como E=m*c^2, sendo 'm' a massa e 'c' a 
#*velocidade da luz. Calcule o logar�tmo natural do valor da energia originada 
#*de um objeto de 10Kg. (Observa��o: use a fun��o round() para arredondar a 
#*resposta de modo que ela tenha apenas duas casas decimais)


41.34

c=300000000
round(log(10*(c^2)), digits = 2)



#*Crie um vetor de dados com o seguinte comando da linguagem R: v<-c(2,5,7,8,9) .
#*Agora tome o seguinte polin�mio f(x) = x^3 + x^2 + x. Calcule a m�dia dos 
#*valores gerados pela fun��o f(x) quando voc� substituir a vari�vel 'x' do 
#*polin�mio pelo vetor 'v'.


394.2

v <- c(2,5,7,8,9)
mean(v^3 + v^2 + v)