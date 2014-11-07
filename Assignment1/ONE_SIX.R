# EMPIRICAL METHODS
#  
#  File: ONE_SIX.R
#
# Author:  Cas van der Weegen & Dylienne Every 
# Version: 0.1

# Question A
M = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment1/cans109.txt") # Load cans109.txt
N = scan("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment1/cans111.txt") # Load cans111.txt

# Find Summary
m = summary(M)
n = summary(N)
# CANS109              CANS111
# 1. Min =>    200     1. Min =>    205
# 2. 1st =>    262     2. 1st =>    275
# 3. Median => 273     3. Median => 285
# 4. 3rd =>    282     4. 3rd =>    294.5
# 5. Max =>    297     5. Max =>    504

# Question B
meanM = mean(M)
meanN = mean(N)
sdM = sd(M)
sdN = sd(N)

# Mean CANS109 => 267.114~
# Mean CANS111 => 281.805~
# Standard Deviation CANS109 => 22.1122~
# Standard Deviation CANS111 => 27.7746~

# Question C
boxplot(M,N, varwidth=TRUE, horizontal=TRUE, names=c("cans109.txt","cans111.txt"), col=c("blue","red")) # Boxplot

# Question D
plot(M,N, col=(c("blue","red"))) # Plot to support Question D [NOT TO BE HANDED IN]

# Question E
