# Load Best Formatted File EVER
w = read.table("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment5/worktime.txt", fill=T) # Load worktime.txt
matrix = as.matrix(w)

# Helper function
f <- function(x){
  out <- tryCatch({
    as.numeric(x)
    }, 
    warning=function(cond){
      return(FALSE)
    })
  return(out)
}

# Parse Matrix in a numeric(), skip invalid and NA values
matrixParser <- function(m){
  res = numeric()
  for(x in 1:dim(m)[1]){
    for(y in 1:dim(m)[2]){
      if(is.numeric(f(m[x,y])) & !is.na(f(f(m[x,y])))){
        res <- c(res, as.numeric(m[x,y]))
      }
    }
  }
  res
}

m = matrixParser(matrix)

A = m[1:50]
B = m[51:100]

# [A]
m1 = mean(A) # Mean
m2 = mean(B) # Mean
s1 = sd(A) # Standard Deviation
s2 = sd(B) # Standard Deviation
n1 = length(A) # Length
n2 = length(B) # Length

se = sqrt(s1*s1/n1+s2*s2/n2); se # [0.1306237] Standard Error
error = qt(0.975, df=pmin(n1,n2)-1)*se; error # [0.2624981] Error 
ans = c((m1-m2)-error, (m1-m2)+error); ans # [-0.06009812  0.46489812]

# [B]
se = sqrt(s1*s1/n1+s2*s2/n2); se # [0.1306237] Standard Error
z = (m1-m2)/se; z # [1.549489] t-value 
sign = 0.5
z.half.sign = qnorm(1-sign/2)
c(-z.half.sign, z.half.sign) # [-0.6744898  0.6744898]

# By taking the average mean of B as the mean-to-be-compared (as done in Assignment4),
# we can calculate if the the value for A is still within significance (of 5%). 
# If this is not the case we can say that both employees work the same amount of hours
# on average.

# [C]
# With a significance level of 0.05 we see that the test statistic (1.549489)
# is NOT within the critical values. We can say that Employee A works more hours.
