## Making a blank Semi-log graph for conservation biology class

#Didn't use this, but might be useful
#source("https://raw.githubusercontent.com/petrkeil/Blog/master/2016_07_05_Log_scales/loglogplot.r")

##Made a dummy csv to plot
y_log <- read.csv("C:\\Users\\ANUSHA\\Dropbox\\bio336_2017\\unit2_population\\survivorship_curve_updated_2017\\log_y.csv")
x_norm <- rep(0:10,1)
bound <- cbind(x_norm,y_log)

theme_new <- theme_set(theme_bw())
theme_new <- theme_update(
  panel.grid=element_line(col='black')
)

##THIS WORKS!!
ggplot(y_log, aes(x,y)) + 
  theme_classic() + theme(panel.grid.major = element_line(color = 'black'), 
                          panel.grid.minor = element_line(color='grey70')) +
  scale_y_continuous(trans='log10', breaks=c(y_log$y), limits=c(NA,1)) + 
  scale_x_continuous(breaks = c(rep(0:10,1)))

## These don't work
plot(1, type="n", xlab="", ylab="", xlim=c(0, 10), ylim=c(0, 1))

loglog.plot(ylog=FALSE, ylim=c(0,0.012), xlim=c(0.1, 1000), xlab="x", ylab="probability density", )

loglog.plot(xlog=FALSE, ylim=c(0,1000), xlim=c(1, 10), xlab="x", ylab="probability density", )
