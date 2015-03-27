library(ggplot2)
library(reshape)
library(gridExtra)
library(ggmap)

## Set wd and Read in csv
setwd("E:\\Toshiba_Desktop\\Stony Brook\\Teaching courses\\Chordate Spring 2015\\Lecture Grades")

midterm <- read.csv("Midterm1.csv")

m.mid <- melt(midterm, id.vars=c("LastName", "Lab_Section"), measure.vars="Midterm1")



## Create plot for midterm 
MidtermPlot <- ggplot(m.mid[which(m.mid$value>0),], aes(Lab_Section,value)) + geom_boxplot(aes(fill = factor(Lab_Section))) +  
  scale_fill_brewer(type = "qual",palette = 1, guide = FALSE) + xlab("Midterm 1") + geom_point() +
  ylab("Points") + theme_bw()
MidtermPlot
median(m.mid$value[m.mid$Lab_Section=="L02"])
