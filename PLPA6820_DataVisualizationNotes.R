#### PLPA Class Notes - Data Visualization ####
# Objective is to learn about data plotting using ggplot2

install.packages("ggplot2") # didn't have it installed so here
library(ggplot2)

mtcars
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point() +
  geom_smooth()
# aes - aesthetic; setting the x and y
# layers are connected w p
