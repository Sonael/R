#Grafico de linhas


x <- 1:15

y <- x**2


# type =  b, o, s, c, h
# pch = 0 : 25
plot(x,y, type = "o",pch = 20,
     cex = 1, col="red",
     xlab = "Numeroszinhos", ylab = "Numeroszãos", main = "Grafico",
     cex.lab = 1.5, cex.axis = 2, cex.main = 2,
     xlim = c(0,15), ylim = c(0,3375))



for (i in 1:5) {
  t <- x**(2 + i)
  lines(t,type = "o",col = "blue")
}


legend("topleft", pch = c(20,1),
       col = c("red", "blue"),
       legend = c("Dados 1", "Dados 2"))




#criando dois gráficos em uma janela gráfica


par(mfrow= c(1,2))


plot(x, y,type = "o",pch =3,
     cex = 2, col = "red")

plot(x,y, type = "o",pch = 20,
     cex = 1, col="red",
     xlab = "Numeroszinhos", ylab = "Numeroszãos", main = "Grafico",
     cex.lab = 1.5, cex.axis = 2, cex.main = 2,
     xlim = c(0,15), ylim = c(0,3375))




#Grafico de Dispersão


plot(iris$Sepal.Length,
     iris$Sepal.Width,
     main = "Iris Data",
     col = iris$Species,
     pch = 17, cex = 2,
     xlab = "Senpal Length",
     ylab = "Petal Length")


legend(x = 4.5, y = 7, pch = 17,
       col = c(1:3), legend = levels(iris$Species))



# grafico de barras


max.temp <- c(30,35,40,38,25,24,23)


barplot(max.temp,
        main = "Máxima Temperatura em uma semana",
        ylab = "Graus em Celsius",
        xlab = "Dia",
        names.arg = c("Sun","Mon","Tue","Wed","Thu","Fri","Sat"),
        col = rainbow(7),
        horiz = T)


# Grafico de barras empilhadas


colors <- c("yellow", "orange", "red")

months <- c("Mar", "Apr", "May", "Jun", "Jul")

regions <- c("East","West", "North")


Values <- 
  matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11),
         nrow = 3,ncol = 5,byrow = T)


barplot(Values, main = "Rendimento Total",
        names.arg = months,
        xlab = "Meses",
        ylab = "Rendimento",
        col = colors,
        beside = T)


legend("topleft",pch= c(15,15,15), col = colors, legend = regions)




# Histograma 
#para mostrar a densidade  `freq = F`



Temperature <- airquality$Temp

hist(Temperature, col = "grey",
     density = 10,
     breaks = 20)



hist(Temperature,col="grey",
     probability = T)

densityTemp <- density(Temperature)

lines(densityTemp)



# Grafico de pizza


x <- c(32,12,30,53) 


labels <- c("Recife","Durham", "Toronto", "Amsterdam")


pie(x, labels,
    main = "Grafico de Cidades",
    col = rainbow(4))


pct <- round(x/sum(x)*100)


lbls <- paste(pct,"%",sep = "")


pie(x, labels = lbls,
    main = "Grafico de Cidades",
    col = rainbow(4))


legend("topright",
       legend = c("Recife","Durham", "Toronto", "Amsterdam"),
       cex = 0.8, fill = rainbow(length(x)))






# Diagrama de Caixa


boxplot(mtcars$mpg)


boxplot(data = mtcars, mpg ~ cyl,
        xlab = "Número de Cilindros",
        ylab = "Milhas por Galão",
        main= "Dados de Milhagem",
        outline = F)



# Salvando gráfico


pdf(file = "saving_plot.pdf")
Temperature <- airquality$Temp
hist(Temperature)
dev.off()
