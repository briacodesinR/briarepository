#### Coding Challenge 3 ####
Mycotoxin <- read.csv("MycotoxinData.csv", na.strings = "na")
Mycotoxin
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


# Question 1
Plot_1 <- ggplot(Mycotoxin, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width = 0.6), color = "#009E73") + # coloring points, setting jitter and jitter width
  scale_fill_manual(values=c("#F0E442", "#0072B2")) + # filling and coloring boxplots
  xlab("") + # labeling x-axis
  ylab("DON(ppm)") + # labeling y-axis
  theme_classic() + # classic theme
  facet_wrap(~Cultivar) # faceted by Cultivar

# Question 2
Mycotoxin$Treatment<- as.factor(Mycotoxin$Treatment)
Mycotoxin$Treatment<- factor(Mycotoxin$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))

# Question 3
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

combined_plot

# Question 5
#adding t-test to the plots and 
Plot_1t <- Plot_1 +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")

Plot_2t <- Plot_2 +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")

Plot_3t <- Plot_3 +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")

combined_plot_t <- ggarrange( # rearranging the plots as one
  Plot_1t,
  Plot_2t,
  Plot_3t,
  ncol = 3,
  nrow=1,
  labels = "auto",
  common.legend = TRUE #common.legend gives all the plots one legend when their keys contain the same items.
)

combined_plot_t







