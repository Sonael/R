#*Vetores aceitam apenas um tipo de dados. O que acontece com xx com o seguinte 
#*comando: xx <- c(TRUE, 2) ?

#TRUE 2
#"TRUE" 2
# V 1 2
#"TRUE" "2"
#0 2



#No R, todos os tipos de dados a seguir são atômicos, EXCETO:

# V Lista
#Inteiro
#Character
# V DataFrame
#Lógico


#*Suponha que você tenha um vetor x <- 1:4 e y <- 2:3. O que é produzido pela 
#*expressão x * y?

#Erro
#3 5 5 7
# V 2 6 6 12
#2 12

#*Dada a tabela no link abaixo que representa uma competição entre Maria e Joana, 
#*determine quem foi a vencedora. Dica: primeiro padronize os dados e depois 
#*calcule a média dos valores padronizados. 
#*https://docs.google.com/drawings/d/1_szurYna3gDzTB3ht9AQlWChbq_KLcCMPNJ22J1ydZI/edit?usp=sharing


#Maria
# V Joana
#Empate
#Nenhuma

M_resultados <- c(42, 102, 38, 2149, 97)
J_resultados <- c(38, 173, 71, 1554, 70)
media <- c(30, 155, 50, 1829, 75)
sd <- c(6, 23, 8, 274, 12)

escore_M <- (M_resultados-media)/sd
escore_J <- (J_resultados-media)/sd

escore_M_M <- mean(escore_M)
escore_J_M <- mean(escore_J)

#Jona obteve os melhores resultados, pois o escore médio é maior para ela.





#*Para responder as questões abaixo, faça download do arquivo disponível em 
#*https://www.dropbox.com/s/6t7b44acy7yfczu/vetor.RData?dl=1 e mova-o para o 
#*seu diretório. Em seguida leia-o com o comando load("vetor.RData") . O 
#*vetor01 possui 15.000 observações referentes às notas dos candidatos do 
#*concurso público para auxiliar administrativo da Prefeitura de São Longuinho. 
#*Os dados foram disponibilizados pela empresa organizadora do concurso. As notas 
#*variam de 0 a 10 e os candidatos que não realizaram a prova estão com NA nos 
#*respectivos campos. De posse dos dados, responda as perguntas abaixo.

#Qual foi a média das notas ?

#4.998
#2.881812
# V 4.992657
#0.0214
#8.304839


#Qual foi a mediana das notas ?

# V 4.998
#2.881812
#4.992657
#0.0214
#8.304839

#Qual o desvio padrão das notas ?

#4.998
# V 2.881812
#4.992657
#0.0214
#8.304839

#Qual foi a quantidade de faltosos ?

#15000
# V 321
#0
#400


#Qual foi percentual de faltosos ?

#0.9786
# V 0.0214
#0.0333
#0.5
#0


#Quantos candidatos obtiveram notas maiores do que 7.00 e menores do que 8.00 ?

# V 1446
#4357
#11768
#14679
#2933


#Quantos candidatos obtiveram notas maiores do que 9.00 ou menores do que 1.00?

# V 2933
#1446
#11768
#14679
#4357

#*Quais os comandos removem os valores ausentes (NA) do vetor01 e guarda o 
#*resultado no próprio vetor01 ?

# V vetor01 <- vetor01[!is.na(vetor01)]
#vetor01 <- vetor01[is.na(vetor01)]
#vetor01 <- !is.na(vetor01)
# V vetor01[!is.na(vetor01)] -> vetor01
# V vetor01 <- vetor01[-which(is.na(vetor01))]
#vetor01 <- vetor01[which(is.na(vetor01))]