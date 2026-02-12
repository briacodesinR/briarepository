# Make a boxplot using ggplot with DON as the y variable, treatment as the x variable, and color mapped to the wheat cultivar. Change the y label to “DON (ppm)” and make the x label blank.
Mycotoxin <- read.csv("MycotoxinData.csv")
Mycotoxin

ggplot(Mycotoxin,aes(x=Treatment, y=DON, color = Cultivar)) +
  geom_boxplot() +
  xlab("") +
  ylab("DON(ppm)") +
  geom_point(position=position_jitterdodge(dodge.width = 0.9), shape = 21,  color = "black", alpha = .5) + # Add points to the foreground of the boxplot and bar chart you made in questions 2 & 3 that show the distribution of points. Set the shape = 21 and the outline color black (hint: use jitter_dodge). 
  facet_wrap(~Cultivar) # Add a facet to the plots based on cultivar


# Convert this data into a bar chart with standard-error error bars using the stat_summary() command
ggplot(Mycotoxin,aes(x=Treatment, y=DON, color = Cultivar)) +
  # Add transparency to the points so you can still see the boxplot or bar in the background
  # Add points to the foreground of the boxplot and bar chart you made in questions 2 & 3 that show the distribution of points. Set the shape = 21 and the outline color black (hint: use jitter_dodge).
  geom_point(position=position_jitterdodge(dodge.width = 0.9), shape = 21,  color = "black", alpha = .5)+  
  stat_summary(fun=mean, geom="bar", position="dodge") +
  stat_summary(fun.data=mean_se, geom="errorbar") +
  xlab("") +
  ylab("DON(ppm)") +
  facet_wrap(~Cultivar) # Add a facet to the plots based on cultivar





  

