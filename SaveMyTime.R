library(reshape)
library(dichromat)
library(scales)
library(ggplot2)

setwd("E:\\Toshiba_Desktop\\Stony Brook\\Administrative Things")

time_saver <- read.csv("SaveMyTime_Oct18.csv")

time_saver2 <- read.csv("SaveMyTime_Oct30_edit.csv")
time_saver2$Day_Month <- paste(time_saver2$Day, time_saver2$Month, sep='_') 

## Saving standard theme  
my_theme <- theme_classic(base_size = 30) + 
  theme(axis.title.y = element_text(color = "black", vjust = 2),
        panel.border = element_rect(colour = "black", fill=NA))

## Theme with slightly smaller font
my_theme2 <- my_theme + theme_classic(base_size = 15)

#Convert milliseconds to minutes
#time_saver2$activity_min <- time_saver2$activityDuration..ms./60000
#head(time_saver2)
#write.csv(time_saver2,file = "SaveMyTime_Oct30_edit.csv")

m.time <- melt(time_saver,id.vars = c("Day", "Month", "Date", "activityName"), 
               measure.vars = "Duration_min")
names(m.time) <- c("Day", "Month", "Date", "activity", "variable", "Duration_min")
head(m.time)

m_time2 <- melt(time_saver2,id.vars = c("S_no", "Day_Month", "activityName", "activityCategoryName"), 
               measure.vars = "duration_min")
names(m_time2) <- c("S_no", "Day_Month", "Activity", "Category", "variable", "Duration_min")
head(m_time2)
m_time2$Day_Month2 <- reorder(m_time2$Day_Month, m_time2$S_no)

m_dur2 <- melt(time_saver2, id.vars = "activityName", measure.vars = "duration_min")
names(m_dur2) <- c("Activity", "var", "duration_min")

ggplot(time_saver, aes(activityName, Duration_min)) + geom_bar(stat ="count")

ggplot(m_time2, aes(Day_Month2, Duration_min, 
                    fill=Activity)) + my_theme2 +
  geom_bar(width = 0.75, stat = "identity") + theme(axis.text.x = element_text(angle=60))

paper_writing <- m_time2[m_time2$Activity=="paper_writing",]
paper_writing$Duration_hr <- paper_writing$Duration_min/60 
  
ggplot(paper_writing, aes(Day_Month2, Duration_hr)) + my_theme2 +
  geom_bar(width = 0.5, stat = "identity") + theme(axis.text.x = element_text(angle=60))

time.agg <- aggregate(time_saver2$duration_min, 
                      by=list(time_saver2$Month, time_saver2$Day), FUN="sum", na.rm=T)
names(time.agg) <- c("Month", "Day", "Total")
