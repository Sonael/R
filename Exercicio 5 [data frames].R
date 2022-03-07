mouse.color <- c("purple", "red", "yellow","brown")

mouse.weight <- c(23, 21, 18, 26)


mouse.info <- data.frame("colour"=mouse.color,"weight"=mouse.weight,
                         stringsAsFactors = FALSE)
str(mouse.info)


mouse.info[3,]

mouse.info[,1]

mouse.info[4,1]

View(airquality)

min(airquality, na.rm = TRUE)

subconjunto <- subset(x = airquality,
                      subset = Ozone > 25 & Temp < 90)


mean(subconjunto[,2], na.rm = TRUE)


summary(airquality)


genomas <- as.data.frame(
  read.csv("https://www.dropbox.com/s/vgh6qk395ck86fp/genomes.csv?dl=1"))


cromossomos <- genomas[genomas$Chromosomes > 40,]

plasmideo <- subset(x = genomas, subset = 
                      genomas$Plasmids > 0 & genomas$Chromosomes > 1)


teste <- plasmideo[plasmideo$Organism == "Acidimicrobiales bacterium",]

str(genomas)

teste <- list()


grupos <- genomas[,2]



cancer_stats <- as.data.frame(read.csv(
  "https://www.dropbox.com/s/g97bsxeuu0tajkj/cancer_stats.csv?dl=1"))




localCancer <- subset(x = cancer_stats, subset = cancer_stats$Class =="Digestive System"
                      & (cancer_stats$Female.Cases > cancer_stats$Male.Cases))


malecases <- cancer_stats[,3] 

maledeaths <- cancer_stats[,5]

casosmulher <- cancer_stats[,4]

mortesmulher <- cancer_stats[,6]



taxasobrevivenciahomem <- malecases/maledeaths

max(taxasobrevivenciahomem, na.rm = TRUE)


cancer_stats$sobreviMulher <- casosmulher/mortesmulher

min(cancer_stats[,7],na.rm = TRUE)







