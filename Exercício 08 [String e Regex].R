v<-c(20,30,4,934,1077,22)


paste(v,'m', sep = '')


poema <- "No meio do caminho tinha uma pedra
tinha uma pedra no meio do caminho
tinha uma pedra
no meio do caminho tinha uma pedra.
Nunca me esquecerei desse acontecimento
na vida de minhas retinas t�o fatigadas.
Nunca me esquecerei que no meio do caminho
tinha uma pedra
tinha uma pedra no meio do caminho
no meio do caminho tinha uma pedra."

nchar(poema)


txt = c("eeer","3ca1n","fg","can","man","sigmean","fa3nta","fan")

grep(pattern = "[c|m|f]an", txt, value = TRUE)


txt = "eeer3GHJca1nfgSigmanfaUIOntafan"

str_extract_all(txt, pattern = c("[[:upper:]]" ,"[[:digit:]]"))




txt = "tttyUFRPE19PPGIAkjgkjghk2j34j321UFRPEcapdPPGIA"
str_extract_all(txt, pattern = "UFRPE([a-z]*|[0-9]*)?PPGIA")


martin <- "'Eu tenho um sonho que um dia nas colinas vermelhas da Ge�rgia os filhos dos descendentes de escravos e os filhos dos desdentes dos donos de escravos poder�o se sentar junto � mesa da fraternidade.

Eu tenho um sonho que um dia, at� mesmo no estado de Mississippi, um estado que transpira com o calor da injusti�a, que transpira com o calor de opress�o, ser� transformado em um o�sis de liberdade e justi�a.

Eu tenho um sonho que minhas quatro pequenas crian�as v�o um dia viver em uma na��o onde elas n�o ser�o julgadas pela cor da pele, mas pelo conte�do de seu car�ter. Eu tenho um sonho hoje!

Eu tenho um sonho que um dia, no Alabama, com seus racistas malignos, com seu governador que tem os l�bios gotejando palavras de interven��o e nega��o; nesse justo dia no Alabama meninos negros e meninas negras poder�o unir as m�os com meninos brancos e meninas brancas como irm�s e irm�os. Eu tenho um sonho hoje!

Eu tenho um sonho que um dia todo vale ser� exaltado, e todas as colinas e montanhas vir�o abaixo, os lugares �speros ser�o aplainados e os lugares tortuosos ser�o endireitados e a gl�ria do Senhor ser� revelada e toda a carne estar� junta.

Esta � nossa esperan�a. Esta � a f� com que regressarei para o Sul. Com esta f� n�s poderemos cortar da montanha do desespero uma pedra de esperan�a. Com esta f� n�s poderemos transformar as disc�rdias estridentes de nossa na��o em uma bela sinfonia de fraternidade. Com esta f� n�s poderemos trabalhar juntos, rezar juntos, lutar juntos, para ir encarcerar juntos, defender liberdade juntos, e quem sabe n�s seremos um dia livre. Este ser� o dia, este ser� o dia quando todas as crian�as de Deus poder�o cantar com um novo significado.

'Meu pa�s, doce terra de liberdade, eu te canto.

Terra onde meus pais morreram, terra do orgulho dos peregrinos,

De qualquer lado da montanha, ou�o o sino da liberdade!'

E se a Am�rica � uma grande na��o, isto tem que se tornar verdadeiro.

E assim ouvirei o sino da liberdade no extraordin�rio topo da montanha de New Hampshire.

Ouvirei o sino da liberdade nas poderosas montanhas poderosas de Nova York.

Ouvirei o sino da liberdade nos engrandecidos Alleghenies da Pennsylvania.

Ouvirei o sino da liberdade nas montanhas cobertas de neve Rockies do Colorado.

Ouvirei o sino da liberdade nas ladeiras curvas da Calif�rnia.

Mas n�o � s� isso. Ouvirei o sino da liberdade na Montanha de Pedra da Ge�rgia.

Ouvirei o sino da liberdade na Montanha de Vigil�ncia do Tennessee.

Ouvirei o sino da liberdade em todas as colinas do Mississipi.

Em todas as montanhas, ouviu o sino da liberdade.

E quando isto acontecer, quando n�s permitimos o sino da liberdade soar, quando n�s deixarmos ele soar em toda moradia e todo vilarejo, em todo estado e em toda cidade, n�s poderemos acelerar aquele dia quando todas as crian�as de Deus, homens pretos e homens brancos, judeus e gentios, protestantes e cat�licos, poder�o unir m�os e cantar nas palavras do velho spiritual negro:

'Livre afinal, livre afinal.

Agrade�o ao Deus todo-poderoso, n�s somos livres afinal.'"


martin <- gsub(pattern = "[D|d]e(us)?",replacement = " ", martin)

str_extract_all(martin, "[N-n]egr[os|o|as|a]")[[1]]

grep(pattern = "[N|n]egr[(os)|o|(as)|a]",martin, value = TRUE)







teste <- c("<an xml tag>", "<opentag> <closetag>","</closetag>","<>","<with attribute="77">","is.?")


grep(pattern = "<[^>]+>",teste,value = TRUE)





aux<- read.delim("https://www.dropbox.com/s/4yr2woj8r1p5sbn/gapminderDataFiveYear.txt?dl=1")


grep(pattern = " and ",aux$country,value = TRUE)

ba <- grep(pattern = "^Ba",aux$country, value = TRUE)

ba <- unique(ba)

land <- grep(pattern = "land$",aux$country, value = TRUE)

land <- unique(land)

Ga <- grep(pattern = "\\bGa",aux$country, value = TRUE)

Ga<-unique(Ga)

sum(length(ba),length(land),length(Ga))
