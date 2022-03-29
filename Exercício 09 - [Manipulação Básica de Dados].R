gatos <- read.csv(file = "catsM.csv",
                         header = TRUE,
                         strip.white = T,
                         na.strings = "")

Caracol_data <- read.csv(file = "Caracol_data_checked.csv",
                         header = TRUE,
                         strip.white = T,
                         na.strings = "")


mean(gatos$Bwt)

mean(Caracol_data$Depth)


female <- Caracol_data[Caracol_data$Sex=="female",]

max(female$Distance)



pardal <- read.table(file = "Sparrows.csv",
                   header = TRUE,
                   sep = ",")



View(pardal)


summary(pardal)

SSTS <- pardal[pardal$Species == "SSTS",]


max(SSTS$Head)

min(SSTS$Head)

which(duplicated(pardal))

levels(pardal$Sex)

pardal$Sex <- factor(pardal$Sex, levels = c("Male","Female", "Males", "Femal","Femal e"))

which(is.na(pardal$Sex))

levels(pardal$Sex)

levels(pardal$Sex)[3] <- "Female"

male <- pardal[pardal$Sex == "Male",]
female <- pardal[pardal$Sex == "Female",]

mean(female$Tarsus)


which(is.na(pardal$Wing))

pardal[806,"Wing"] <- 57


mean(pardal$Wing)

Sparrows_Ordenado <- Pardais[order(Pardais$Wing,Pardais$Head),]
