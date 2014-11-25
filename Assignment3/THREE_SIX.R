simul12 = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment3/simul12.txt")
simul22 = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment3/simul22.txt")
dell = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment3/dell.txt")
logdell = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment3/logdell.txt")
klm = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment3/klm.txt")
iqdata2 = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment3/iqdata2.txt")

f = function(dataset){
  par(mfrow=c(1,3))
  h <- hist(dataset, breaks=10, density=10)
  multiplier <- h$counts / h$density
  xfit <- seq(min(dataset),max(dataset),length=length(dataset)) 
  yfit <- dnorm(xfit,mean=mean(dataset),sd=sd(dataset)) 
  yfit <- yfit*diff(h$mids[1:2])*length(dataset) 
  par(mfrow=c(1,3))
  plot(h, xlab="Accuracy", main="Histogram of Dataset")
  lines(xfit, yfit, col="black", lwd=2)
  boxplot(dataset, main="Boxplot of Dataset")
  qqnorm(dataset,
         main="Normal Q-Q Plot of Dataset",
         xlab="Theoretical Quantiles",
         ylab="Sample Quantiles")
  qqline(dataset)
}