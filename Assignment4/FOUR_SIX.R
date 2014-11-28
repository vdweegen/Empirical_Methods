iq = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment4/iqdata3.txt") # Load iqdata3.txt

# [A]
m = mean(iq, na.rm=TRUE) # Point Estimate [94.33333]
error <- qt(0.975,df=length(iq)-1)*sd(iq)/sqrt(length(iq)) # Verified with t.test()
left <- mean(iq)-error # Calculate Left
right <- mean(iq)+error # Calcuate Right
interval <- c(left,right) # Confidence Interval [88.41782 100.24885]

# [C]
z = (mean(iq)-100)/(sd(iq)/sqrt(length(iq))); z # [-1.969059]
sign = .05 
z.half.sign = qt(1-sign/2, df=length(iq)-1) 
ans = c(-z.half.sign, z.half.sign); ans # [-2.055529  2.055529]
# Using the t- distribution we DO NOT reject the hypothesis
# since the the value for ans is withing the confidence interval

# [D]
z = (mean(iq)-100)/(sd(iq)/sqrt(length(iq))); z # [-1.969059]
p = 2 * pnorm(z); p    # Calculate Lower Tail [0.04894633]

# Using the standard normal distribution we reject the hypothesis
# since the the value for p < than the significance