library(ggplot2)
library(reshape)
library(gridExtra)
library(ggmap)

## Set wd and Read in csv
setwd("E:\\Toshiba_Desktop\\Stony Brook\\Teaching courses\\Chordate Spring 2015\\Lab Grades")
cq_prac <- read.csv("CQ_Prac_comparison.csv")
cq_prac2 <- read.csv("CQ_Prac2_comparison.csv",stringsAsFactors=F)
names(cq_prac) <- c("Section", "CQ", "Prac1 Total", "TA Questions")
names(cq_prac2) <- c("Section", "CQ1", "Prac1 Total", "TA1", "CQ2", "Prac2 Total", "TA2")

nhpaper <- 

## Melt
m.cq_prac <- melt(cq_prac, measure.vars = c("CQ","Prac1 Total","TA Questions"), na.rm=T)
m.cq_prac2 <- melt(cq_prac2, id.vars= "Section",measure.vars = c("CQ2","TA1","CQ2", "TA2"), na.rm=T)

##Separate CQ and prac
m.cq <- m.cq_prac[m.cq_prac$variable=="CQ",]
m.ta <- m.cq_prac[m.cq_prac$variable=="TA Questions",]

m.cq2 <- m.cq_prac2[m.cq_prac2$variable=="CQ2",]
m.ta2 <- m.cq_prac2[m.cq_prac2$variable=="TA2",]

## Create plot for just CQ's - PRAC 1
cqPlot <- ggplot(m.cq, aes(variable, as.numeric(value))) + geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") + 
  scale_fill_brewer(type = "qual",palette = 1) + xlab("CQs Prac 1") + ylab("Points") +
  scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))

## Create plot for just TA questions -  PRAC 1

pracPlot <- ggplot(m.ta, aes(variable, value)) + geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") +
  scale_fill_brewer(type = "qual",palette = 1) + xlab("TA questions Prac 1") + ylab("Points") +
  scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))

## Create plot for just CQ's - PRAC 2
cqPlot2 <- ggplot(m.cq2, aes(variable, as.numeric(as.character(value)))) + geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") + 
  scale_fill_brewer(type = "qual",palette = 1) + xlab("CQs Prac 2") + ylab("Points") +
  scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))

## Create plot for total prac - PRAC 2
pracPlot2 <- ggplot(m.ta2, aes(variable, as.numeric(as.character(value)))) + geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") +
  scale_fill_brewer(type = "qual",palette = 1) + xlab("TA questions Prac 2") + ylab("Points") +
  scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))

## Plot both - PRAC 1
grid.arrange(cqPlot, pracPlot, nrow=2, ncol=1)

## Plot both - PRAC 2
grid.arrange(cqPlot2, pracPlot2, nrow=2, ncol=1)

## Plot PRAC 1 and PRAC 2
grid.arrange(cqPlot, cqPlot2, pracPlot, pracPlot2, nrow=2, ncol=2)

nhpaper <- 