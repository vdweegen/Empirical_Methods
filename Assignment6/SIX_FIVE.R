w = read.table("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment6/crime.txt", fill=T) # Load crime.txt

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
# Load Data
male_age <- matrixParser(as.matrix(w[3:20,1]))
male_income <- matrixParser(as.matrix(w[3:20,2]))
male_crimes <- matrixParser(as.matrix(w[3:20,3]))
female_age <- matrixParser(as.matrix(w[23:49,1]))
female_income <- matrixParser(as.matrix(w[23:49,2]))
female_crimes <- matrixParser(as.matrix(w[23:49,3]))

# [A]
plot(male_age, male_crimes, main="Scatterplot Male Age/Crimes", xlab="Male Age", ylab="Male Crimes")
abline(lm(male_crimes~male_age), col="red") # regression line (y~x) 
lines(lowess(male_age,male_crimes), col="blue") # lowess line (x,y)

m1 = cor(male_age, male_crimes); m1 # -0.07095301
# With a correlation coefficient this low it is safe to assume
# that there is no correlation

plot(male_income, male_crimes, main="Scatterplot Male Income/Crimes", xlab="Male Income", ylab="Male Crimes")
abline(lm(male_crimes~male_income), col="red") # regression line (y~x) 
lines(lowess(male_income,male_crimes), col="blue") # lowess line (x,y)

m2 = cor(male_income, male_crimes); m2 # 0.7915573
# With a correlation coefficient this high it is same to assume
# that there is a correlation

# [B]
lmsim = lm(male_crimes~male_income); lmsim # [1.7811 0.2864]

# [C]
summary(lm(male_crimes~male_income))$r.squared # 0.6265629
# With a value of 0.6265629 we can say that about 63% of
# the (future) data will fit the patterns thusly saying 
# that the income for males can be linked at the male
# crimerate

# [D]
# We test that there is no linear relationship between the two variables
# income and crimes (Beta) as signiticance level 5% (Alpha = 0.05)
p = cor.test(male_crimes,male_income)$p.value; p # [9.097168e-05]
# Because the p-value is (alot) smaller then 0.05, we can conclude
# that there is NO linear relationship, thusly we ACCEPT the 
# hypothesis (Beta0)

# [E]
# - We assume that the error term is independent of x [TRUE]
# - We assume that x is normally distributed [TRUE]
# - We assume that x has a zero mean [?]
# - We assume that x has a constant variance [?]