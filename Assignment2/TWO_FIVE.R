# [A]
pcointoss = function(t,p){
  q = 1 - p
  pbinom(q*t,t,p) - pbinom(p*t,t,q)
}

c1 = pcointoss(10, 0.4)
c2 = pcointoss(25, 0.4)
c3 = pcointoss(100, 0.4)
c4 = pcointoss(500, 0.4)

# As we can see the probability relative quickly rises to 1, which
# means that the probability of gettings heads grows until it is
# a certainty. We verify this as following:

rcointoss = function(n,p){
  x = numeric() # Init variable
  for(i in 1:n) { # Execute n times
    x[i] = (rbinom(n=1,size=i,prob=p)/i)
  }
  x # Return data
}
p = .4
plot(rcointoss(1000,p), type="l", col="red", xlab="Throws", ylab="Rel. frequency")
abline(h=p)

# [B]

# We can see that the chance of HEADS moves toward its actual probability (in this
# case .4), the line converges onto the abline(.4)
#
#