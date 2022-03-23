#Imprime as Strings

print("Sonael Neto")

cat("Sonael", "Neto", sep = " ")

paste("Sonael", "Neto")

txt <- "Sonael Neto"

strsplit(txt, split = " ")

toupper(txt)

tolower(txt)

#apagando espaços em branco

install.packages("stringr")

library(stringr)

str_trim(" Sonael Neto ")


#substituindo Textos

gsub("Neto", "De Albuquerque",txt)


#obter partes dos textos

substr(txt, 1, 4)

#retornar a quantidade de caracteres

nchar(txt)



#REGEX

# .

strings <- c("^ab", "Ab", "ac", "abc", "abd", "abe", "ab 12")

grep("ab.", strings, value = TRUE)



# []


texto <- c("Eu", "Amo", "a", "Rural")


grep(pattern = "[m]", texto,value = TRUE)

numerics <- c("123", "21-abril", "I-II-III", "R 3.0.1")

grep(pattern = "[01]", numerics, value = TRUE)

grep(pattern = "[0-9]", numerics, value = TRUE)

grep(pattern = "[^0-9]", numerics, value = TRUE)


# * qualquer quantidade (significa 0 vezes ou mais ocorrências de um padrão)

strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")

grep("ac*b", strings, value = TRUE)


# +  (significa 1 vez ou mais ocorrências de um padrão)

grep("ac+b", strings, value = TRUE)


# ? (no máximo 1 vez)

grep("ac?b", strings,value = TRUE)



# chaves {n,m} significa o número de repetições

grep("ac{2}b",strings,value = TRUE)

grep("ac{2,}b",strings,value = TRUE)

grep("ac{2,3}b",strings,value = TRUE)



# ^ (busca correspondência no início da string)

strings <- c("abcd", "cdab", "cabd", "c abd")

grep("ab",strings,value = TRUE)

grep("^ab",strings,value = TRUE)



# $ (Busca correspondência no fim da string)


strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")


grep("ab$", strings,value = TRUE)



# \d (busca correspondencia com os digitos)

string <- c("Eu Amo a Rural 2020")

gsub("\\d","#",string)



# Ou ( | ) 

strings <- c("^ab", "Ab", "ac", "abc", "abd", "abe", "ab 12")

grep("abc|abd",strings, value = TRUE)



# Grupo ()

strings <- c("ha", "haha", "hahaha", "kkkk")

grep("(ha)+",strings,value = TRUE)

strings <- c("Bom-dia","Boa-Noite","Boa-Tarde")

grep("Boa-(Tarde|Noite)",strings,value = TRUE)


# Retrovisor (\1 ... \9)

strings <- c("Eu amo a Rural","Eu amo amo a Rural")

grep("Eu (amo) \\1 a Rural", strings, value = TRUE)

numeros <- c(1,30,344,333,555,3333,33)

grep("([0-9])\\1\\1",numeros,value = TRUE)


# POSIX

texto <- "Eu gosto de Cerveja! #cerveja, @cade_minha_cerveja, Eu gosto (v3.2.2) #rr2020"

#remover espaços em branco ou tabs
gsub(pattern = "[[:blank:]]",replacement = "", texto)

# Substituir pontuação por espaços em branco
gsub(pattern = "[[:punct:]]",replacement = " ", texto)

# Remover caracteres alfanumérico
gsub(pattern = "[[:alnum:]]",replacement = "", texto)




#Exemplos praticos

#Extrair digitos de uma sequencia de caracteres
string <- "Meu numero é 123456789"

gsub(pattern = "[^0-9]",replacement = "",x = string)


#Retornar o index de um valor, caso o mesmo esteja presente em um vetor

valores <- c("A1","A2","A3","A4","A5","A6","A7")

grep("A1|A4", valores,value = FALSE)


#extrair apenas os valores em pares de valores chaves

string <- c("G1:E001","G2:E002","G3:E003")

gsub(".*:",replacement = "",x = string)


#extrair informações contidas dentro de parênteses de uma string

string <- "Oq vai fazer amanhã ? (Estudar CPAD) Ver vídeos (Jogar) (Nadar)"

str_extract_all(string = string, "\\(.*?\\)")[[1]]


#extrair endereços de e-mail de uma determinada string

string <- c("sonaelneto@gmail.com bla bla bla bla sonael.angelos@ufrpe.br")

str_extract_all(string, pattern = "\\S*@\\S*")
