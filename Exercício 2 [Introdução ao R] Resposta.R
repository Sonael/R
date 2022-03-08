#Escolha as opções corretas: 

# V O R é case sensitive.
#Comentários no R se utiliza "%".
#É necessário definir os tipos das variáveis no R.
#rm() lista os elementos da memória.
#library() é usado para instalar pacotes.
# V O correto é usar "<-" para atribuir valores a uma variável.



#A expressão F == FALSE, retorna:

# V TRUE
#FALSE



#Selecione as declarações corretas:

#aux!
#1contador
# V teste_121
#B$
#c-ccc123
# V teste_


#Com relação a objetos e funções, escolha a resposta correta.

#Um escalar não é considerado um objeto no R.
#Funções não realizam processamentos.
#sum() não é uma função no R.
# V O resultado de um teste estatístico é considerado um objeto no R.
#Funções não possuem parâmetros.


#*Dado que temos a seguinte soma: 10^2 + 11^2 + ... + 20^2, qual a expressão 
#*correspondente em R.


#(10:20)
#(10:20)^2
# V sum((10:20)^2)
#mul((10:20)^2)
#sum((10:20)*2)



#* Atribua o valor 133 para X e o valor 36 para Y. Em sequência, adicione a soma 
#* de X e Y a Z. Depois, calcule a raiz quadrada de Z e o logaritmo natural do 
#* resultado da raiz quadrada. Por fim, arredonde o resultado para zero dígitos. 
#* Qual o valor resultante ? Note que a resposta é um número inteiro.

3

x<-133
y<-36
z<-x+y
round(log(sqrt(z)), digits = 0)



#*Pesquise a respeito da "sequência de Fibonacci" (a sequência inicia com ZERO) e 
#*obtenha os cinco primeiros números dessa sequência. Qual o logarítimo natural 
#*da soma desses cinco números? (Observação: use a função round() para arredondar 
#*a resposta de modo que ela tenha apenas três casas decimais)


1.946

x<-sum(0,1, 1, 2, 3)
round(log(x), digits = 3)

#*Dada a função f(x) = sin(x) + x. Calcule o valor da derivada de primeira ordem 
#*de f(x) quando x=2. (Observação: use a função round() para arredondar a resposta 
#*de modo que ela tenha apenas três casas decimais)

0.584

#Note que a derivada de primeira ordem de f(x) é 'f(x) = cos(x)+1.

round( cos(2)+1, digits = 3 )


#*Calcule o factorial de 10. Com o resultado em mãos, calcule o logaritmo de base 10
#*desse resultado. (Observação: use a função round() para arredondar a resposta de 
#*modo que ela tenha apenas duas casas decimais)


6.56

round(log10(factorial(10)), digits = 2)


#*Suponha que a velocidade da luz seja c = 300000000 m/s. A equação da equivalência 
#*massa-energia de Einstein é dada como E=m*c^2, sendo 'm' a massa e 'c' a 
#*velocidade da luz. Calcule o logarítmo natural do valor da energia originada 
#*de um objeto de 10Kg. (Observação: use a função round() para arredondar a 
#*resposta de modo que ela tenha apenas duas casas decimais)


41.34

c=300000000
round(log(10*(c^2)), digits = 2)



#*Crie um vetor de dados com o seguinte comando da linguagem R: v<-c(2,5,7,8,9) .
#*Agora tome o seguinte polinômio f(x) = x^3 + x^2 + x. Calcule a média dos 
#*valores gerados pela função f(x) quando você substituir a variável 'x' do 
#*polinômio pelo vetor 'v'.


394.2

v <- c(2,5,7,8,9)
mean(v^3 + v^2 + v)