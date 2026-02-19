#### Coding Challenge 3 ####
Mycotoxin <- read.csv("MycotoxinData.csv", na.strings = "na")
Mycotoxin
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


# create a boxplot of DON by Treatment so that the plot looks like the image below

ggplot(Mycotoxin, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width = 0.6), color = "#009E73") + # coloring points, setting jitter and jitter width
  scale_fill_manual(values=c("#F0E442", "#0072B2")) + # filling and coloring boxplots
  xlab("") + # labeling x-axis
  ylab("DON(ppm)") + # labeling y-axis
  theme_classic() + # classic theme
  facet_wrap(~Cultivar) # faceted by Cultivar

# Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70.

