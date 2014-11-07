# EMPIRICAL METHODS
#  
#  File: ONE_SEVEN.R
#
# Author:  Cas van der Weegen & Dylienne Every 
# Version: 0.1

source("/mnt/storage/Dropbox/VU/Empirical_Methods/Assignment1/mileage.txt") # SOURCE the mileage file
mpg1 = mileage$mpg1
cyl1 = mileage$cyl1
mpg2 = mileage$mpg2
cyl2 = mileage$cyl2

# Remove Garbage
rm(mileage)

# Take averages
avg1 = mpg1 / cyl1
avg2 = mpg2 / cyl2

# Make a boxplot of the two averages
boxplot(avg1,avg2, varwidth=TRUE, horizontal=TRUE, names=c("Cars Type 1","Cars Type 2"), col=c("purple","green")) # Boxplot

# Get Summary
# Cars Type 1          Cars Type 2
# 1. Min => 1.938      1. 1.300
# 2. 1st => 2.879      2. 1.928
# 3. Median => 5.088   3. 3.108
# 4. 3rd => 7.594      4. 5.700
# 5. Max => 9.325      5. 8.475