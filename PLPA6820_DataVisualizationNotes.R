#### PLPA Class Notes - Data Visualization ####
# Objective is to learn about data plotting using ggplot2

install.packages("ggplot2") # didn't have it installed so here
library(ggplot2)

mtcars
# line of best fit is on top of the points
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point() +
  geom_smooth(method = lm, se=FALSE)
# aes - aesthetic; setting the x and y
# layers are connected w p
# lm - linear model

# line of best fit is below the points bc it's the last layer
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_smooth(method = lm, se=FALSE) +
  geom_point(aes(color = hp, size = hp)) +
  xlab("Weight(tons)") +
  ylab("Miles per gallon") +
  scale_color_gradient(low = "green", high = "red")

# xlab and ylab change the names of the axes

bull.richness <- read.csv("Bull_richness.csv")
ggplot(bull.richness, aes(x=GrowthStage, y=richness, fill=Fungicide, color = Fungicide)) +
  geom_boxplot() +
  geom_point(position = position_jitterdodge()) +
  scale_fill_manual(values = c("orange", "darkblue")) +
  scale_color_manual(values = c("darkgreen","pink"))

ggplot(bull.richness, aes(x=GrowthStage, y=richness, fill=Fungicide, color=Fungicide)) +
  stat_summary(fun = mean, geom="bar", position="dodge") +
  stat_summary(fun.data=mean_cl_normal, geom="errorbar", position = "dodge")

ggplot(bull.richness, aes(x=GrowthStage, y=richness, group=Fungicide, color=Fungicide)) +
  stat_summary(fun = mean, geom="line") +
  stat_summary(fun.data=mean_cl_normal, geom ="errorbar")+
  facet_wrap(~Treatment*Crop)
