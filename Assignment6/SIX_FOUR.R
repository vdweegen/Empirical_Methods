ibu = read.table("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment6/ibuprofen.txt", header=T, quote="\"")

# [A]
# The hypothesis (Beta) is that -if taken 6 hours 
# before climbing- ibuprofen reduced altidude sickness.
fisher = fisher.test(ibu); fisher # p-value = 0.0184
# With a significance level (a) of 5% (0.05) we can 
# conclude that ibuprofen does NOT reduce altitude
# sickness since p < a, hence we reject
# the hypothese (Beta)

# [B]
#
# Yes, a chi-test could be done the following way:
chisq.test(ibu, correct=F)

# This results in the following information: X-squared = 5.8294.
# df=1, p-value = 0.01576

# Or by hand, why not?
n = sum(ibu); n
a = sum(ibu[1,]); a
b = sum(ibu[,1]); b
Lo = max(0,a+b-b)
Hi = min(a,b)
sampletheta = ibu[1,1]*ibu[2,2] / (ibu[1,2]*ibu[2,1]); sampletheta;
x = Lo:Hi ;x
theta = x*(n-a-b+x)/((a-x)*(b-x))
prob = choose(a,x)*choose(n-a,b-x)/choose(n,b)
sum(prob)
cbind(x,theta,prob)