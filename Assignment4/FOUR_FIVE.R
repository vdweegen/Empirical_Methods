source("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment4/temp.R")

#[A]

debilt.temp = na.omit(temp$debilt) # Omit missings / Load Values
n = length(debilt.temp)    # Valid Values
k = sum(debilt.temp > 20)  # Sum values we want
pest = k/n; pest; # Point estimate [0.05]

# [B]

# Estimate Standard error with value from previous assignment
error = sqrt(pest * (1-pest)/n); error # Standard Error [0.04873397]

# Since there are two tails, 95% would simply be the 97.5th Quantile
merror = qnorm(.975)*error; merror # Margin of Error [0.09551683]

# Calculate the interval
interval = pest + c(-merror, merror) # Interval [-0.0455 / 0.0987]

# [C]   prob = 0.95, z = 1.96, p > 0.05 
z = (pest = 0.01) / sqrt(0.01*(1 - 0.01)/length(debilt.temp)); z # [0.4494666]
sign = .05 
z.half.sign = qnorm(1-sign/2) 
ans = c(-z.half.sign, z.half.sign); ans # [-1.959964  1.959964]