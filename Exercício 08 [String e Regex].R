v<-c(20,30,4,934,1077,22)


paste(v,'m', sep = '')


poema <- "No meio do caminho tinha uma pedra
tinha uma pedra no meio do caminho
tinha uma pedra
no meio do caminho tinha uma pedra.
Nunca me esquecerei desse acontecimento
na vida de minhas retinas tão fatigadas.
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


martin <- "'Eu tenho um sonho que um dia nas colinas vermelhas da Geórgia os filhos dos descendentes de escravos e os filhos dos desdentes dos donos de escravos poderão se sentar junto à mesa da fraternidade.

Eu tenho um sonho que um dia, até mesmo no estado de Mississippi, um estado que transpira com o calor da injustiça, que transpira com o calor de opressão, será transformado em um oásis de liberdade e justiça.

Eu tenho um sonho que minhas quatro pequenas crianças vão um dia viver em uma nação onde elas não serão julgadas pela cor da pele, mas pelo conteúdo de seu caráter. Eu tenho um sonho hoje!

Eu tenho um sonho que um dia, no Alabama, com seus racistas malignos, com seu governador que tem os lábios gotejando palavras de intervenção e negação; nesse justo dia no Alabama meninos negros e meninas negras poderão unir as mãos com meninos brancos e meninas brancas como irmãs e irmãos. Eu tenho um sonho hoje!

Eu tenho um sonho que um dia todo vale será exaltado, e todas as colinas e montanhas virão abaixo, os lugares ásperos serão aplainados e os lugares tortuosos serão endireitados e a glória do Senhor será revelada e toda a carne estará junta.

Esta é nossa esperança. Esta é a fé com que regressarei para o Sul. Com esta fé nós poderemos cortar da montanha do desespero uma pedra de esperança. Com esta fé nós poderemos transformar as discórdias estridentes de nossa nação em uma bela sinfonia de fraternidade. Com esta fé nós poderemos trabalhar juntos, rezar juntos, lutar juntos, para ir encarcerar juntos, defender liberdade juntos, e quem sabe nós seremos um dia livre. Este será o dia, este será o dia quando todas as crianças de Deus poderão cantar com um novo significado.

'Meu país, doce terra de liberdade, eu te canto.

Terra onde meus pais morreram, terra do orgulho dos peregrinos,

De qualquer lado da montanha, ouço o sino da liberdade!'

E se a América é uma grande nação, isto tem que se tornar verdadeiro.

E assim ouvirei o sino da liberdade no extraordinário topo da montanha de New Hampshire.

Ouvirei o sino da liberdade nas poderosas montanhas poderosas de Nova York.

Ouvirei o sino da liberdade nos engrandecidos Alleghenies da Pennsylvania.

Ouvirei o sino da liberdade nas montanhas cobertas de neve Rockies do Colorado.

Ouvirei o sino da liberdade nas ladeiras curvas da Califórnia.

Mas não é só isso. Ouvirei o sino da liberdade na Montanha de Pedra da Geórgia.

Ouvirei o sino da liberdade na Montanha de Vigilância do Tennessee.

Ouvirei o sino da liberdade em todas as colinas do Mississipi.

Em todas as montanhas, ouviu o sino da liberdade.

E quando isto acontecer, quando nós permitimos o sino da liberdade soar, quando nós deixarmos ele soar em toda moradia e todo vilarejo, em todo estado e em toda cidade, nós poderemos acelerar aquele dia quando todas as crianças de Deus, homens pretos e homens brancos, judeus e gentios, protestantes e católicos, poderão unir mãos e cantar nas palavras do velho spiritual negro:

'Livre afinal, livre afinal.

Agradeço ao Deus todo-poderoso, nós somos livres afinal.'"


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
