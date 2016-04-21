library(ggplot2)
library(reshape)
library(gridExtra)
library(ggmap)

## Set wd and Read in csv
setwd("E:\\Toshiba_Desktop\\Stony Brook\\Teaching courses\\Chordate Spring 2016\\HeadTA_grading")
cq_prac <- read.csv("Lab\\CQ_Prac_comparison2.csv")
cq_prac2 <- read.csv("CQ_Prac2_comparison.csv",stringsAsFactors=F)
#names(cq_prac) <- c("Section", "CQ", "TA Questions", "Prac1 Total")
#names(cq_prac2) <- c("Section", "CQ1", "Prac1 Total", "TA1", "CQ2", 
                     "Prac2 Total", "TA2", "CQ3", "Prac3 Total", "TA3")
nhpaper <- read.csv("NHpaper.csv")

## Melt
m.cq_prac <- melt(cq_prac, id.vars="Section", 
                  measure.vars = c("CQ1","TA1","CQ2", "TA2","CQ3", "TA3"), na.rm=T)
m.cq_prac2 <- melt(cq_prac2, id.vars= "Section",
                   measure.vars = c("CQ1","TA1","CQ2", "TA2","CQ3", "TA3"), na.rm=T)

m.nhpaper <- melt(nhpaper, id.vars="Grader", measure.vars="Total", na.rm=T)

##Separate CQ and prac
m.cq <- m.cq_prac[m.cq_prac$variable %in% c("CQ1","CQ2", "CQ3"),]
m.ta <- m.cq_prac[m.cq_prac$variable %in% c("TA1","TA2","TA3"),]

m.cq2 <- m.cq_prac2[m.cq_prac2$variable=="CQ2",]
m.ta2 <- m.cq_prac2[m.cq_prac2$variable=="TA2",]

m.cq3 <- m.cq_prac2[m.cq_prac2$variable=="CQ3",]
m.ta3 <- m.cq_prac2[m.cq_prac2$variable=="TA3",]

## Create plot for just CQ's
cqPlot <- ggplot(m.cq, aes(variable, as.numeric(as.character(value)))) + 
  geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") + 
  scale_fill_brewer(type = "qual",palette = 1) + xlab("CQs Questions") + ylab("Points") +
 # scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), 
        axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))
cqPlot

## Create plot for just TA questions
pracPlot <- ggplot(m.ta, aes(variable, as.numeric(as.character(value)))) + 
  geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") +
  scale_fill_brewer(type = "qual",palette = 1) + xlab("TA questions") + ylab("Points") +
  #scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), 
        axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))
pracPlot

## Create plot for just CQ's - PRAC 2
cqPlot2 <- ggplot(m.cq2, aes(variable, as.numeric(as.character(value)))) + 
  geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") + 
  scale_fill_brewer(type = "qual",palette = 1) + xlab("CQs Prac 2") + ylab("Points") +
  scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), 
        axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))

## Create plot for TA prac - PRAC 2
pracPlot2 <- ggplot(m.ta2, aes(variable, as.numeric(as.character(value)))) + 
  geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") +
  scale_fill_brewer(type = "qual",palette = 1) + xlab("TA questions Prac 2") + ylab("Points") +
  scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), 
        axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))

## Create plot for just CQ's - PRAC 3
cqPlot3 <- ggplot(m.cq3, aes(variable, as.numeric(as.character(value)))) + 
  geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") + 
  scale_fill_brewer(type = "qual",palette = 1) + xlab("CQs Prac 3") + ylab("Points") +
  scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), 
        axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))

## Create plot for TA prac - PRAC 3
pracPlot3 <- ggplot(m.ta3, aes(variable, as.numeric(as.character(value)))) + 
  geom_boxplot(aes(fill = factor(Section))) +  
  geom_point() + facet_wrap(~Section, nrow=1) + theme_bw() + theme(legend.position = "none") +
  scale_fill_brewer(type = "qual",palette = 1) + xlab("TA questions Prac 3") + ylab("Points") +
  scale_x_discrete(labels="") +
  theme(text=element_text(family="sans"), 
        axis.title.x = element_text(size=16, vjust=0.2, face="bold"), 
        axis.text.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=16, face="bold"), axis.text.y = element_text(size=12)) +
  theme(strip.text.x = element_text(size = 14))

## Plot both - PRAC 1
grid.arrange(cqPlot, pracPlot, nrow=2, ncol=1)

## Plot both - PRAC 2
grid.arrange(cqPlot2, pracPlot2, nrow=2, ncol=1)

## Plot PRAC 1, 2, 3
grid.arrange(cqPlot, cqPlot2, cqPlot3, pracPlot, pracPlot2, pracPlot3, nrow=2, ncol=3)

## Plot for natural history paper
nhplot <- ggplot(m.nhpaper, aes(Grader, value), na.omit=T) + geom_boxplot() + 
  geom_point() + theme_bw(base_size = 30) + ylab("Points")
nhplot
