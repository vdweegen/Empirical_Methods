# [A]
f = function(n, m, s){
  x <- rnorm(n, mean = m, sd = s)
  h <- hist(x, breaks=10, density=10, col="lightblue", xlab="Accuracy", main="Overall")
  multiplier <- h$counts / h$density
  xfit <- seq(min(x),max(x),length=n) 
  yfit <- dnorm(xfit,mean=m,sd=s) 
  yfit <- yfit*diff(h$mids[1:2])*length(x) 
  par(mfrow=c(1,2))
  plot(h)
  lines(xfit, yfit, col="black", lwd=2)
  qqnorm(x,
         main="Normal Q-Q Plot",
         xlab="Theoretical Quantiles",
         ylab="Sample Quantiles")
  qqline(x)
}

# [B]
#  The samplesize seems to have the largest influence on the formation
#  of the normal curve. Changing the mean en sd has effect, but mostly
#  on samplesizes below 300. When values are higher than 300 the curve
#  usally a normalcurve.
