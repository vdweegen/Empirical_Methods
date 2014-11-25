# [A]

# P(HEADS) = 0.4
# P(TAILS) = 1 - P(HEADS) = 0.6
# The distribution will be binominal that is slightly
# out of balance towards to HEADS side of the curve

# [B]
# For each and every throw there is a 40% chance of getting HEADS,
# and a 60% chance of getting TAILS. The probabily of
# P(HH) = 0.4 * 0.4 = 0.16 = 16%
# P(TT) = 0.6 * 0.6 = 0.36 = 36%
# P(One of each) = 0.4 * 0.6 * 2 = 0.48 = 48%
#   The latter is because P(HT) is the same as P(TH)

# [C]
# 
# sqrt(n * p * (1 -p))
# sqrt(0.4 * 0.6) = 0.489897949 = 0.49

# [D]
#
# This will result in a binominal distribution,
# when a sample is taken that is large enough the binominal
# distribution is equal to the normal distribution
#
# mean = n * p
# pow(sd) = n * p * (1 - p)
# sd = sqrt(n * p * (1 - p))
#
# [D, EXAMPLES]
#  
# Lets say we Toss 100 times 
# mean = 100 * 0.4 = 40
# sd = sqrt(100 * 0.4 * 0.6) = 4.898979486
#
#
# [E]
# Cointoss function when n is the amount of tosses and p is the probability
cointoss = function(n,p){
  x = numeric() # Init variable
  for(i in 1:n) { # Execute n times
    x[i] = rbinom(n=1,size=n,prob=p)
  }
  x # Return data
}

# [F]
m1 = cointoss(50, 0.4)
s1 = m1/50
m2 = cointoss(500, 0.4)
s2 = m2/500
m3 = cointoss(1000, 0.4)
s3 = m3/1000
m4 = cointoss(5000, 0.4)
s4 = m4/5000
par(mfrow=c(2,2))
hist(s1, main="50 Flips", prob=TRUE, col="red")
hist(s2, main="500 Flips", prob=TRUE, col="blue")
hist(s3, main="1000 Flips", prob=TRUE, col="yellow")
hist(s4, main="5000 Flips", prob=TRUE, col="green")

#[G]
#
# We can see here, that with a greater amount of cointosses the binominal distribution
# becomes a normal distribution