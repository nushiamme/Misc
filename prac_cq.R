library(ggplot2)
library(reshape)
library(gridExtra)

## Set wd and Read in csv
setwd("E:\\Toshiba_Desktop\\Stony Brook\\Teaching courses\\Chordate Spring 2015\\Lab Grades")
cq_prac <- read.csv("CQ_Prac_comparison.csv")

## Melt
m.cq_prac <- melt(cq_prac, measure.vars = c("CQ_Average","Prac1_total"), na.rm=T)

## Rename values in Section column to make plot clearer. I know there's a better way to do this, oh well.
m.cq_prac$Section[m.cq_prac$Section=="3"] <- "Section 3"
m.cq_prac$Section[m.cq_prac$Section=="5"] <- "Section 5"
m.cq_prac$Section[m.cq_prac$Section=="6"] <- "Section 6"

## Just CQ's
m.cq <- m.cq_prac[m.cq_prac$variable=="CQ_Average",]
cqPlot <- ggplot(m.cq, aes(variable,value)) + geom_boxplot(aes(fill = factor(Section))) +  
  facet_wrap(variable~Section) + theme_bw() + theme(legend.position = "none") + 
  scale_fill_brewer(type = "qual",palette = 1)

## Total prac 
m.prac <- m.cq_prac[m.cq_prac$variable=="Prac1_total",]
pracPlot <- ggplot(m.prac, aes(variable,value)) + geom_boxplot(aes(fill = factor(Section))) +  
  facet_wrap(variable~Section) + theme_bw() + theme(legend.position = "none") +
  scale_fill_brewer(type = "qual",palette = 1)

## Plot both
grid.arrange(cqPlot, pracPlot, nrow=2, ncol=1)

