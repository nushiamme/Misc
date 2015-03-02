library(ggplot2)
library(reshape)
library(gridExtra)

cq_prac <- read.csv("E:\\Toshiba_Desktop\\Stony Brook\\Teaching courses\\Chordate Spring 2015\\Lab Grades\\CQ_Prac_comparison.csv")

m.cq_prac <- melt(cq_prac, measure.vars = c("CQ_Average","Prac1_total"), na.rm=T)

m.cq <- m.cq_prac[m.cq_prac$variable=="CQ_Average",]
m.prac <- m.cq_prac[m.cq_prac$variable=="Prac1_total",]
cqPlot <- ggplot(m.cq, aes(variable,value)) + geom_boxplot(aes(fill = factor(Section))) +  
  facet_wrap(variable~Section) + theme_bw() + theme(legend.position = "none") + 
  scale_fill_brewer(type = "qual",palette = 1)
pracPlot <- ggplot(m.prac, aes(variable,value)) + geom_boxplot(aes(fill = factor(Section))) +  
  facet_wrap(variable~Section) + theme_bw() + theme(legend.position = "none") +
  scale_fill_brewer(type = "qual",palette = 1)

grid.arrange(cqPlot, pracPlot, nrow=2, ncol=1)

