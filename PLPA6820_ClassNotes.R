#### PLPA6820 Class Notes ####
This is a section but one # can be used to make comments
R is case-sensitive, so capitalization makes a difference
addition (+), subtraction (-), division (/), multiplication (*)
ctrl + enter can be used to run a line of code
#####

#### Practicing Basic Operations ####
2+2
2-2
2/2
2*2

#####

#### Objects ####
# the arrow or the equals sign can be used for an equals
# Numeric Variables
x <- 2
y = 3
x+y
y-x

# Character Variables; these end up as character (non numeric) variables and not numeric values
name = "Bria" # must be within quotation marks or apostrophes
"three" = 3
x + three

# Functions
class(three) # tells the class of the object
vec <- c(1:6) # creates a vector using the concatenate fxn, colon generates a sequence
mean (vec) # finds the mean of the vector
sd(vec) # stdev
sum (vec) # sums all variables in vector
median(vec) # finds median
min(vec)  # minimum 
max(vec)  # maximum
summary(vec)  #IQR - output depends on the data class
abs(vec) # absolute value
sqrt(vec) # square root
log(vec) # natural log
log10(vec) # log base 10
exp(vec) # power of e

# Logical Operators
3 > 2 # greater than
1 < 2 # less than
1 <= 2 # less than or equal to
4 == 4 # equal to
1 == 2 | 1 == 1 # | means 'OR'
1 == 2 & 1 == 1 # & means 'AND' 
1 != 2 # != means not equal to

# Matrices and Data Frames
mat1 <- matrix(data = c(1, 2, 3), nrow = 3, ncol = 3)
mat1
mat2 <- matrix(data = c("Zach", "Jie", "Tom"), nrow = 3, ncol = 3)
mat2

df <- data.frame(mat1[,1], mat2[,1])
df
colnames(df) <- c("value","name")
df

# Indexing
vec[4]
mat2[3]
mat1[1,3]
mat2[2,]

df[1,]
df[,"value"]


install.packages("ggplot2")

library(tidyverse)
# read.csv allows you to import a csv file; file.choose allows it to be pulled up in the console









#####
