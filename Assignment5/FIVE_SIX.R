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
n1 = length(A); n1 # [50] Valid Values Employee A
k1 = sum(A < 3.5); k1 # [9] Sum values we want for Employee A
pest1 = k1/n1; pest1 # [0.18] Point estimate for Employee A

n2 = length(B); n2 # [50] Valid Values Employee B
k2 = sum(B < 3.5); k2 # [18] Sum values we want for Employee B
pest2 = k2/n2; pest2 # [0.36] Point estimate for Employee B

n = (n1+n2)/2
pest = pest1 / pest2; pest # [0.50] Point Estimate

# [B]
# Estimate Standard error with value from previous assignment
se = sqrt(pest * (1-pest)/n); se # [0.07071068] Standard Error

# Since there are two tails, 95% would simply be the 97.5th Quantile
error = qnorm(.975)*se; error #  [0.1385904] Margin of Error

# Calculate the interval
interval = pest + c(-error, error); interval # [0.3614096 0.6385904] Interval 

