library(ggplot2)
library(reshape)

cq_prac <- read.csv("E:\\Toshiba_Desktop\\Stony Brook\\Teaching courses\\Chordate Spring 2015\\Lab Grades\\CQ_Prac_comparison.csv")

m.cq <- melt(cq_prac, id.vars = "Section", measure.vars = c("CQ_Average","Prac1_total"))

ggplot(m.cq, aes(variable,value)) + geom_boxplot() +  
  facet_wrap(variable~Section,scales="free_y") + theme_bw()

ggplot(m.cq, aes(variable,value)) + geom_boxplot() +
  facet_wrap(variable~Section,scales="free_y") + coord_cartesian(ylim = c(0, 10)) + theme_bw()
