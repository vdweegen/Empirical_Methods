load("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment4/Ass2.RData")

confint = function(x, n, B){
  m = mean(x) # Population Mean
  res = numeric()
  for(i in 1:B){
    smpl <- sample(x, n, replace = FALSE, prob = NULL)
    error <- qt(0.975,df=length(smpl)-1)*sd(smpl)/sqrt(length(smpl)) # Verified with t.test()
    left <- mean(smpl)-error # Calculate Left
    right <- mean(smpl)+error # Calcuate Right
    if((left < m) && (m < right)){
      res <- c(res, c(left, m, right)) # Check if Population mean is in Range
    }
  }
  (((length(res)/3)/B)*100) # Return
}

confint(iTuneslib, 20, 5)
confint(iTuneslib, 50, 5)
confint(iTuneslib, 100, 5)
confint(iTuneslib, 200, 5)
confint(iTuneslib, 500, 5)
confint(iTuneslib, 1000, 5)
confint(iTuneslib, 20, 5)
confint(iTuneslib, 20, 50)
confint(iTuneslib, 20, 100)
confint(iTuneslib, 20, 200)
confint(iTuneslib, 20, 500)
confint(iTuneslib, 20, 1000)
confint(iTuneslib, 20, 5)
confint(iTuneslib, 50, 50)
confint(iTuneslib, 100, 100)
confint(iTuneslib, 200, 200)
confint(iTuneslib, 500, 500)
confint(iTuneslib, 1000, 1000)