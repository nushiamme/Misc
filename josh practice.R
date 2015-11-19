help.start()
x <- rnorm (50)
y <- rnorm (x)
ls()
rm (x,y)
x <- 1:20
w <- 1 + sqrt (x)/2
dummy <- data.frame (x=x, y= x + rnorm (x) *w)
dummy
fm1 <-lm (y ~ x, data=dummy)
summary (fm1)
fm1<-lm(y~x,data=dummy,weight=1/w^2)
attach(dummy)
plot (x, y)
lrf <- lowess (x,y)
rm(fm, fm1, lrf, x, dummy)

