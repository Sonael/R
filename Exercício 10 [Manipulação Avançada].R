library(dplyr)
library(tidyr)

df=data.frame(Theoph)

df %>%
  select(Dose)

df%>%filter(Dose>5)

df %>% slice(10:20)


slice(df,between(row))

df %>% filter(Dose>5,Time > mean(Time))

mean(df$Time)



teste <- df%>%arrange(desc(Wt))


teste <-
  df%>%arrange(Wt,desc(Time))

df <- df%>%mutate(tendencia = Time)


df%>%summarise(max(conc))


max(df$conc)


################################################################



atraso_voo <- read.csv(file = "L_UNIQUE_CARRIERS.csv_",
                       header = TRUE,
                       strip.white = T,
                       na.strings = "",
                       quote = "\"",
                       sep = ",")


codigos <- read.csv(file = "673598238_T_ONTIME_REPORTING.csv",
                    header = TRUE,
                    strip.white = T,
                    na.strings = "",
                    quote = "\"",
                    sep = ",")
