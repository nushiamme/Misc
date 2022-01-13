## Pratik's biotin unbound and bound data
## Jan 12, 2022
## Script by Anusha Shankar

library(dplyr)
library(ggplot2)
library(reshape)

unbound <- read.csv("C:\\Users\\nushi\\OneDrive\\AS-PK\\Pratik_biotin.csv")

head(unbound)


my_theme <- theme_classic(base_size = 30) + 
  theme(panel.border = element_rect(colour = "black", fill=NA))

#m.unbound <- melt(unbound, id.vars = "X", measure.vars = c("Unbound", "Bound"))

unbound$Compound <- factor(unbound$Compound, levels= c("HTL-Biotin", "HTL-635", "Biotin-635", "Biotin-646"))

unbound$ID <- paste(unbound$Compound, unbound$Bound, sep="_")

unbound$ID <- factor(unbound$ID, levels=c("HTL-Biotin_Unbound", "HTL-Biotin_Bound", "HTL-635_Unbound", "HTL-635_Bound",
                                          "Biotin-635_Unbound", "Biotin-635_Bound", "Biotin-646_Unbound", "Biotin-646_Bound"))

ggplot(unbound, aes(ID, value)) + my_theme +
  #geom_boxplot(col="grey90") +
  geom_point(aes(col=Bound), size=4, alpha=0.7) + 
  scale_color_manual(values = c("magenta", "black")) + 
  geom_line(aes(group=Number)) +
  theme(axis.text.x = element_text(size=12)) +
  xlab("Compound") + ylab("Fraction of total mitochondria")



df.summary <- m.unbound %>%
  group_by(variable) %>%
  summarise(
    sd = sd(value, na.rm = TRUE),
    value = mean(value)
  )
df.summary

ggplot(df.summary, aes(variable, value)) + my_theme +
  geom_errorbar(aes(ymin=value-sd, ymax=value+sd)) + 
  geom_point(color="red", size=3, alpha=0.8) +
  geom_point(data = m.unbound, aes(variable, value), size=3)


ggplot(m.unbound, aes(variable, value)) + my_theme +
  geom_boxplot() +
  geom_point(color="red", size=3, alpha=0.8) +
  geom_point(data = m.unbound, aes(variable, value), size=3)

