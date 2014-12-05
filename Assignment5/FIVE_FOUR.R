source("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment5/temp.R")
debilt.temp = na.omit(temp$debilt) # Omit missings / Load Values
eelde.temp = na.omit(temp$eelde) # Omit missings / Load Values

# [A]
# Have 3 Plots per Row

par(mfrow=c(2,2))
# Q-Q Plot of both Samples, the line is drawn to go through the first and thirs quantile,
# If all points are on the line the sample is normal
qqnorm(debilt.temp)
qqline(debilt.temp, col = "red", main = "Q-Q Normal Plot of De Bilt")

qqnorm(eelde.temp)
qqline(eelde.temp, col = "red", main = "Q-Q Normal Plot of Eelde")

qqplot(debilt.temp,eelde.temp, main = "Normal Q-Q Plot to Compare The Two Samples",
      xlab="Temperature of 'de Bilt'", ylab="Temperature of 'Eelde'")

qqnorm(c(debilt.temp, eelde.temp), main = "Normal Q-Q Plot to Compare The Two Samples")
qqline(c(debilt.temp, eelde.temp), col = "red")

# [B]
# t.test(debilt.temp,eelde.temp) # To Verify
m1 = mean(debilt.temp) # Mean
m2 = mean(eelde.temp) # Mean
s1 = sd(debilt.temp) # Standard Deviation
s2 = sd(eelde.temp) # Standard Deviation
n1 = length(debilt.temp) # Length
n2 = length(eelde.temp) # Length

se = sqrt(s1*s1/n1+s2*s2/n2); se # [0.518595] Standard Error
error = qt(0.975, df=pmin(n1,n2)-1)*se; error # [1.085432] Error 
ans = c((m1-m2)-error, (m1-m2)+error); ans # [-0.4004318  1.7704318]

# [C]
# prob = 0.95, z = 1.96, p > 0.05
se = sqrt(s1*s1/n1+s2*s2/n2); se # [0.518595] Standard Error
z = (m1-m2)/se; z # [1.320877] t-value 
sign = 0.5
z.half.sign = qnorm(1-sign/2)
c(-z.half.sign, z.half.sign) # [-0.6744898  0.6744898]

# The Test Statistic (1.320877) does NOT lie in between the critical values,
# hence we DO reject the hypothesis.

# [D]
# Yes, because we have a sample mean and n>30. The information is therefore enough for the Hypothesis.

