# EMPIRICAL METHODS
#  
#  File: ONE_FIVE.R
#
# Author:  Cas van der Weegen & Dylienne Every 
# Version: 0.1

# Question A
M = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment1/sample3.txt") # Load Sample3.txt
hist(M, xlim=range(0:25), ylim=range(0:15), main="Histogram Representation of Sample3.txt") # Histogram
boxplot(M, range=1, width=1, varwidth=FALSE, horizontal=FALSE, names=c("sample3.txt"), col=c("yellow")) # Boxplot

# Question B
sd(M) # Standard Deviation (Sigma) => 4.136276
mean(M) # Mean of the dataset (for normal distribution, Mu) => 10.8019
median(M) # Median of the dataset (for skewed distribution) => 0.931717
min(M) # Min value of the dataset
max(M) # Max value of the dataset


# Question C
# Which would mean:
# 68% of the data is within (Mu - Sigma) and (Mu + Sigma)
# 95% of the data is within (Mu - 2*Sigma) and (Mu + 2*Sigma)
# 99.7% of the data is within (Mu - 3*Sigma) and (Mu + 3*Sigma)

# QUANTILE PLOT
length(M) # Sample Size
summary(M) # Summary
M = M[!is.na(M)] # Remove missing values
n = length(M) # Find non-missing values
mean.M = mean(M) # Mean
var.M = var(M) # Variance
sd.M = sd(M) # Standard Deviation

probabilities = (1:n)/(n+1) # Calucate Probabilities (formula: k/(n-1) for k = 1,..,n)
normal.quantiles = qnorm(probabilities, mean(M, na.rm = T), sd(M, na.rm = T)) # Calculate Quantiles
# Plot
plot(sort(normal.quantiles), sort(M) , xlab = 'Theoretical Quantiles from Normal Distribution', ylab = 'Sample Quqnatiles of M', main = 'Normal Quantile-Quantile Plot of M')

# From the resulting plot you can see there are holes around +- 12, +-16/17/18 and +- 21,
# These holes are nearing the Max and it is logical less values will populate this area which
# Allows for holes to form

# <HIER MOET NOG WAT BIJ>

# QUESTION D
M = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment1/sample4.txt") # Load Sample4.data
boxplot(M, range=1, width=1, varwidth=FALSE, horizontal=FALSE, names=c("sample3.txt"), col=c("yellow")) # Boxplot
sd(M) # Standard Deviation (Sigma) => 3.738502
mean(M) # Mean of the dataset (for normal distribution, Mu) => 9.887716
median(M) # Median of the dataset (for skewed distribution) => 10.50476
min(M) # Min value of the dataset
max(M) # Max value of the dataset

# QUESTION E
#
# It is possible (but unlikely), the mean and standard deviation are too far apart. It would result in:
# 68% of the data is within (Mu - Sigma) and (Mu + Sigma)
# 95% of the data is within (Mu - 2*Sigma) and (Mu + 2*Sigma)
# 99.7% of the data is within (Mu - 3*Sigma) and (Mu + 3*Sigma)
#
# SET3
# Mu = 10.8019 / Sigma = 4.136276
# 68% of the points are in between 6.665624 - 14.938176
# 95% of the points are in between 2.529348 - 19.074452
# 99.7% of the points are in between -1.606928 - 23.210728
#
# SET4
# Mu = 9.887716 / Sigma = 3.738502
# 68% of the points are in between 6.149214 - 13.626218
# 95% of the points are in between 2.410712 - 17.36472
# 99.7% of the points are in between -1.32779 - 21.10322