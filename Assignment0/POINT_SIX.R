# Question A
M = read.table("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment0/sample1.txt") # Load Sample1.data
M = as.matrix(M)
hist(M, prob=T,main="Histogram Plot of sample1.txt")

# Question B
y=x^2
x=seq(0,5,by=0.1)
plot(x,y)

# Question C
# is.numeric(school) => returns TRUE/FALSE if a value is numeric or not
# table(school) => returns a (sorted) list of values
# barplot(table(school)) => plots a 2D representation of the table data
# col=c("black", "yellow", "brown", "red") => returns columns of the data provided