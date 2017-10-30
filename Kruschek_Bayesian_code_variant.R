# Graph of for exercise 3.3, from Kruschkejk Bayesian edition 1, chapter 3
mean <- 162
sdval <- 15
xlow <- 0 # Specify low end of x-axis.
xhigh <- 1 # Specify high end of x-axis.
dx <- 0.02 # Specify interval width on x-axis
# Specify comb points along the x axis:
x <- seq( from = xlow , to = xhigh , by = dx )
# Compute y values, i.e., probability density at each value of x:
y <- 6*x*(1-x)
# Plot the function. "plot" draws the intervals. "lines" draws the bell curve.
plot( x , y , type="h" , lwd=1 , cex.axis=1.5, 
      xlab="x" , ylab="p(x)" , cex.lab=1.5
      , main="Normal Probability Density" , cex.main=1.5 )
lines( x , y )
# Approximate the integral as the sum of width * height for each interval.
area <- sum( dx * y )
# Display info in the graph.
text( -sdval , .9*max(y) , bquote( paste(mu ," = " ,.(meanval)) )
      , adj=c(1,.5) )
text( -sdval , .8*max(y) , bquote( paste(sigma ," = " ,.(sdval)) ),
      adj=c(1,.5) )
text( sdval , .9*max(y) , bquote( paste(Delta , "x = " ,.(dx)) ),
      adj=c(0,.5) )
text( sdval , .8*max(y) ,
      bquote(paste( sum(,x,) , " " , Delta , "x p(x) = " , .(signif(area,3)) )),
      adj=c(0,.5) )
# Save the plot to an EPS file.
dev.copy2eps( file = "IntegralOfDensity.eps" )