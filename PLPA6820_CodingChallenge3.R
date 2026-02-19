#### Coding Challenge 3 ####
Mycotoxin <- read.csv("MycotoxinData.csv", na.strings = "na")
Mycotoxin
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


# create a boxplot of DON by Treatment so that the plot looks like the image below

Plot_1 <- ggplot(Mycotoxin, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width = 0.6), color = "#009E73") + # coloring points, setting jitter and jitter width
  scale_fill_manual(values=c("#F0E442", "#0072B2")) + # filling and coloring boxplots
  xlab("") + # labeling x-axis
  ylab("DON(ppm)") + # labeling y-axis
  theme_classic() + # classic theme
  facet_wrap(~Cultivar) # faceted by Cultivar

# Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70".
Mycotoxin$Treatment<- as.factor(Mycotoxin$Treatment)
Mycotoxin$Treatment<- factor(Mycotoxin$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))

#  Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 into three separate R objects.
Plot_2 <- ggplot(Mycotoxin, aes(x = Treatment, y = X15ADON, color = Cultivar, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width = 0.6), color = "#009E73") + # coloring points, setting jitter and jitter width
  scale_fill_manual(values=c("#F0E442", "#0072B2")) + # filling and coloring boxplots
  xlab("") + # labeling x-axis
  ylab("15ADON") + # labeling y-axis
  theme_classic() + # classic theme
  facet_wrap(~Cultivar) # faceted by Cultivar

Plot_3 <- ggplot(Mycotoxin, aes(x = Treatment, y = MassperSeed_mg, color = Cultivar, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width = 0.6), color = "#009E73") + # coloring points, setting jitter and jitter width
  scale_fill_manual(values=c("#F0E442", "#0072B2")) + # filling and coloring boxplots
  xlab("") + # labeling x-axis
  ylab("Seed Mass (mg)") + # labeling y-axis
  theme_classic() + # classic theme
  facet_wrap(~Cultivar) # faceted by Cultivar

# Question 4
combined_plot <- ggarrange(
  Plot_1,
  Plot_2,
  Plot_3,
  ncol = 3,
  nrow=1,
  labels = "auto",
  common.legend = TRUE #common.legend gives all the plots one legend when their keys contain the same items.
  )
  

# Question 5