# [A]
# set var:
par(mfrow=c(2,2))

# [I]
# N(3,5)
x = rnorm(50, 3, sqrt(5))
qqnorm(x,main="Normal Q-Q Plot N(3,5)",
       xlab="Theoretical Quantiles",
       ylab="Sample Quantiles")
qqline(x)

# [II]
# Chi-Squared distribution
x = rchisq(50,df=8)
qqnorm(x,main="Normal Q-Q Plot Chi-Squared",
        xlab="Theoretical Quantiles",
        ylab="Sample Quantiles")
qqline(x)

# [III]
# t-distribution
x = rt(50, df=6)
qqnorm(x,main="Normal Q-Q Plot T-Distribution",
       xlab="Theoretical Quantiles",
       ylab="Sample Quantiles")
qqline(x)

# [IV]
# exponential-distribution
x = rexp(50, rate=1)
qqnorm(x,main="Normal Q-Q Plot Exponential Distribution",
       xlab="Theoretical Quantiles",
       ylab="Sample Quantiles")
qqline(x)
