load("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment2/Ass2.RData")

# [A]
# Songs are Population, Length is the variable of interest
m = mean(iTuneslib) # Get Mean of iTuneslib
s = sd(iTuneslib) # Get Standard Deviation

# [B]

# Function multisample
multisample = function(dataset, n = 6, s = 36){
  x=numeric() # Init variable
  for(i in 1:n) { # Execute 6 times
    x = cbind(x, sample(dataset,s, replace = TRUE)) # Draw a sample of size 36 from iTuneslib and store in matrix
  }
  x # Return the Matrix
}

# Get data from multisample
samples = multisample(iTuneslib)

# Get amount of columns
cols = length(samples[1,])

# Print answer to Question B
for(i in 1:cols){
  print(paste("Mean of Sample ",i,"is: ",mean(samples[,i])))
  print(paste("Standard Deviation of Sample ",i,"is: ",sd(samples[,i])))
}

# => HIER MOET NOG 'DESCRIBE BRIEFLY WHAT YOU SEE'

# [C]

# Central Limit Threorem states that, given a large enough number of samples
# of independant random variables will result in a normal distribution
#
# Certain conditions apply such as a welldefined expected value
# and a welldefined variance.

# Define function to do the work for us
drawHistForSample = function(dataset, draws){ # In case we forget a large number, set a default picker-function
  b = multisample(dataset, draws) # We leave the default 36 samplesize and run B 'draws' times
  # Get amount of columns
  c = length(b[1,])
  # Create numeric with a size of 'draws'
  x = numeric(draws)
  
  for(i in 1:c){
    x[i] = mean(b[,i])
  }
  #hist(sort(x), freq=FALSE)
  dnorm(x)
}

drawHistForSample(iTuneslib, 50)


# [D]
# Run the function with a generated Large Randon Number
drawHistForSample(iTuneslib, sample(500:1000, 1))

# [E]
#
# The Plot drawn in both C and D shows a obvious normal distribution.
# We can see that the normal-distribution becomes more obvious/clean/smooth
# for draw values (B) of 40+