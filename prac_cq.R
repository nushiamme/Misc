library(ggplot2)
library(reshape)
library(gridExtra)

## Set wd and Read in csv
setwd("E:\\Toshiba_Desktop\\Stony Brook\\Teaching courses\\Chordate Spring 2015\\Lab Grades")
cq_prac <- read.csv("CQ_Prac_comparison.csv")
names(cq_prac) <- c("Section", "CQ", "Prac1 Total")

## Melt
m.cq_prac <- melt(cq_prac, measure.vars = c("CQ","Prac1 Total"), na.rm=T)

## Rename values in Section column to make plot clearer. I know there's a better way to do this, oh well.
m.cq_prac$Section[m.cq_prac$Section=="3"] <- "Section 3"
m.cq_prac$Section[m.cq_prac$Section=="5"] <- "Section 5"
m.cq_prac$Section[m.cq_prac$Section=="6"] <- "Section 6"

Separate CQ and prac
m.cq <- m.cq_prac[m.cq_prac$variable=="CQ",]
m.prac <- m.cq_prac[m.cq_prac$variable=="Prac1 Total",]

## Create plot for just CQ's
cqPlot <- ggplot(m.cq, aes(variable,value)) + geom_boxplot(aes(fill = factor(Section))) +  
  facet_wrap(variable~Section) + theme_bw() + theme(legend.position = "none") + 
  scale_fill_brewer(type = "qual",palette = 1) + xlab("CQs") + ylab("Points") +
  theme(text=element_text(family="sans"), axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))


## Create plot for total prac 
pracPlot <- ggplot(m.prac, aes(variable,value)) + geom_boxplot(aes(fill = factor(Section))) +  
  facet_wrap(variable~Section) + theme_bw() + theme(legend.position = "none") +
  scale_fill_brewer(type = "qual",palette = 1) + xlab("Practical totals") + ylab("Points") +
  theme(text=element_text(family="sans"), axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))

## Plot both
grid.arrange(cqPlot, pracPlot, nrow=2, ncol=1)

