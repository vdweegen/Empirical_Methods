# Define Helper Function
floepie = function(m,s,n,t,sign){
  p <- rep(NA,t)
  for(i in 1:t){
    set.seed(i)
    x <- rnorm(n,m,s)
    p[i] <- t.test(x,alternative="two.sided",m=0)$p.value
  }
  # Returns how TRUE/FALSE is divided
  mean(p<sign)
}

# [A] => Significance is 0.05
# Probability of making a Type I error
floepie(0,1,10,100,0.05) # [0.03]

# [B]
# Give probability of making a Type I error
floepie(0,1,50,100,0.05) # [0.08]
floepie(0,1,100,100,0.05) # [0.02]
floepie(0,1,500,100,0.05) # [0.03]
floepie(0,1,1000,100,0.05) # [0.04]
