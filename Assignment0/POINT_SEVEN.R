# Uitwerking van A
x = c(1,5,-3)
mod = function(x){x*5+3}
mod(x)

# Uitwerking van B [run=> x = mod() ]
mod=function(n=50){ # n = amount of draws
 x=sample(1:100,n,replace=T) # Draw a sample of size 50 
 length(x[x>=41])/n
}

# Uitwerking van C [run=> x = mod() ]
mod=function(n=50,mr=40,mw=60){ # n = amount of draws
 x=sample(1:(mr+mw),n,replace=T) # Draw a sample of size 50 
 length(x[x>=(mr+1)])/n
}

# Uitwerking van D
mod = function(){
 x=1:100 # Create vector with length 100 [you can verify this with length(x)]
 # run 100 times
 for(i in 1:100) {
  s=sample(1:80,20) # Draw a sample of size 20 from 1 .. 80
  x[i] = median(s)
 }
 x
}