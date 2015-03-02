library(reshape)
library(ggplot2)
species <- read.csv("C:\\Users\\ANUSHA\\Desktop\\Species_taxa.csv")

head(species)

sp <- melt(species, measure.vars = "Category", na.rm=T)
ggplot(species, aes(Category)) + geom_bar() + 
  theme_bw() + theme(axis.text.x = element_text(angle = 60, hjust = 1))