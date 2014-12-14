source("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment6/austen.R")

# [A]
# A test of homogeneity would preferably be used, since we're trying
# to determine whether the frequency counts are distributed identically
# across two different population (namely the population: 'Jane Austen'
# and the population 'Admirer')

# [B]
Sand = unname(austen4[0:7,3:4]) # Extract Sandition

# Below generated error because we have very few values
chisq.test(Sand) # X-squared = 22.6816, df = 6, p-value = 0.0009105

# With simulated p
chisq.test(Sand, simulate.p.value = T) # X-squared = 22.6816, df = NA, p-value = 0.0004998

# [C]
# Since the p-value is less then 0.001 (in both the regular and the test
# with p-simulation) we can conclude that the admirer was NOT 
# successfull in imitating Jane Austen