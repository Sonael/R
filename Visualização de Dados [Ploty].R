install.packages("plotly")
library(plotly)



#grafico de Dispersão



fig <- plot_ly(data = iris,
        x = ~Sepal.Length,
        y = ~Petal.Length)

# Renomeando Eixos dos graficos


fig <- fig%>%
  layout(xaxis = list(title= "Sépalas"),
         yaxis = list(title = "Pétalas"))




#alterar paleta de cores

fig <- plot_ly(data = iris,
               x = ~Sepal.Length,
               y = ~Petal.Length,
               color = ~Species)

fig

fig <- plot_ly(data = iris,
               x = ~Sepal.Length,
               y = ~Petal.Length,
               color = ~Species,
               colors = "Dark2")

fig


#Renomeando valores na legenda

levels(iris$Species)
levels(iris$Species) <- c("Setosa", "Versicolor", "Virginica")

fig <- plot_ly(data = iris,
               x = ~Sepal.Length,
               y = ~Petal.Length,
               color = ~Species,
               colors = "Dark2")



fig <- fig%>%
  layout(xaxis = list(title= "Sépalas"),
         yaxis = list(title = "Pétalas"))


fig


# Grafico de linha

#distrubuição normal de 100 valores com média 5
trace_0 <- rnorm(100,mean = 5)
trace_1 <- rnorm(100,mean = 0)
trace_2 <- rnorm(100,mean = -5)

x <- c(1:100)

data <- data.frame(x,trace_0)


fig <- plot_ly(data, x = ~x, y = ~trace_0,
               mode = "lines", name = "Trace_0")

fig


#multiplas linhas em um grafico


fig <- plot_ly(data, x = ~x)%>%
  add_trace(y = ~trace_0,
            name = 'trace_0',
            mode = "lines")%>%
  add_trace(y = ~trace_1,
            name = 'trace_1',
            mode = "lines+markers")%>%
  add_trace(y = ~trace_2,
            name = 'trace_2',
            mode = "markers")

fig




# grafico de barras


Animals <- c("Giraffes","Orangutans","Monkeys")


SF_Zoo <- c(20,14,23)


data <- data.frame(Animals, SF_Zoo)


fig <- plot_ly(data, x  = ~Animals, y = ~SF_Zoo, type = "bar")

fig


#multiplas colunas

Animals <- c("Girafa","Orangotango","Macacos")

Dois_Irmãos_zoo <- c(20,14,23)

outro_zoo <- c(12,18,29)

data <- data.frame(Animals, Dois_Irmãos_zoo, outro_zoo)


fig <- plot_ly(data,
               x = ~Animals,
               y = Dois_Irmãos_zoo,
               type = "bar",
               name = "Dois Irmão Zoo")%>%
  add_trace(y = ~outro_zoo,
            name = 'Outro Zoo')%>%
  layout(yaxis = list(title = "Quantidade"))


fig



# Grafico de caixa


data <- data.frame(values=rnorm(50),index = c(1:50))


plot_ly(data, y = ~values, type = "box")



#Dois Graficos


data <- data.frame(
  values1 = rnorm(50),
  values2 = rnorm(50),
  index = c(1:50)
)

fig <- plot_ly(data,
               y= ~values1,
               type = "box",
               name = "values 1")%>%
  add_trace(y = ~values2,
            name = 'Values 2')%>%
  layout(yaxis = list(title = "valores"))

fig

#Grafico de pizza


presentes <- c(10,40)

genero <- c("Mulher","Homem")

data <- data.frame(genero,presentes)

fig <- plot_ly(data, labels=~genero,values = ~presentes,type = "pie")

fig
