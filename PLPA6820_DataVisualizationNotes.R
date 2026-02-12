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

# Data Visualization Part 2
library (tidyverse)
install.packages("ggpubr")
install.packages("ggrepel")

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# this is a colorblind friendly palette

sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings = "na")
sample.data.bac$Time_Point <- as.factor(sample.data.bac$Time_Point)
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)
sample.data.bac$Crop <- factor(sample.data.bac$Crop, levels = c("Soil", "Cotton", "Soybean"))

str(sample.data.bac)

# Bacterial evenness; Figure 2a 
bac.even <- ggplot(sample.data.bac, aes(x = Time_Point, y = even, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as even, and color by Crop
  geom_boxplot(position = position_dodge(0.85)) +  # Add boxplots with dodged positions to avoid overlap
  geom_point(position = position_jitterdodge(0.05)) +  # Add jittered points to show individual data points, avoiding overlap
  ylab("Pielou's evenness") +  # Label the y-axis
  xlab("Hours post sowing") +  # Label the x-axis
  scale_color_manual(values = cbbPalette, name = "", labels = c("Soil no seeds", "Cotton spermosphere", "Soybean spermosphere")) +  # Manually set colors and labels for the Crop variable
  theme_classic()   # Use a classic theme for the plot
bac.even

sample.data.bac.nosoil <- subset(sample.data.bac, Crop != "Soil")

water.imbibed <- ggplot(sample.data.bac.nosoil, aes(Time_Point, 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_jitter(width = 0.5, alpha = 0.5) +  # Add jittered points to show individual data points with some transparency
  stat_summary(fun = mean, geom = "line", aes(group = Crop)) +  # Add lines representing the mean value for each Crop group
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +  # Add error bars representing the standard error of the mean
  xlab("Hours post sowing") +  # Label the x-axis
  ylab("Water Imbibed (mg)") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("", "")) +  # Manually set colors for the Crop variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +  # Customize theme: remove strip background and position legend to the right
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales
water.imbibed

# Figure 2c
water.imbibed.cor <- ggplot(sample.data.bac.nosoil, aes(y = even, x = 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: y-axis as even, x-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_point(aes(shape = Time_Point)) +  # Add points with different shapes based on Time.Point
  geom_smooth(se = FALSE, method = lm) +  # Add a linear model smooth line without confidence interval shading
  xlab("Water Imbibed (mg)") +  # Label the x-axis
  ylab("Pielou's evenness") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("Cotton", "Soybean")) +  # Manually set colors for the Crop variable
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("0 hrs", "6 hrs", "12 hrs", "18 hrs")) +  # Manually set shapes for the Time.Point variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales

water.imbibed.cor

figure2 <- ggarrange(
  water.imbibed,  # First plot: water.imbibed
  bac.even,  # Second plot: bac.even
  water.imbibed.cor,  # Third plot: water.imbibed.cor
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 3,  # Arrange the plots in 3 rows
  ncol = 1,  # Arrange the plots in 1 column
  legend = FALSE  # Do not include a legend in the combined figure
)

bac.even + 
  stat_compare_means(method = "anova")
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.format")
water.imbibed.cor + 
  stat_cor()
water.imbibed.cor + 
  stat_cor(label.y = 0.7) +
  stat_regline_equation()

diff.abund <- read.csv("diff_abund.csv")
str(diff.abund)

diff.abund$log10_pvalue <- -log10(diff.abund$p_CropSoybean)
diff.abund.label <- diff.abund[diff.abund$log10_pvalue > 30,]
ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  theme_classic() + 
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label))

volcano <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) + 
  scale_color_manual(values = cbbPalette, name = "Significant") +
  theme_classic() + 
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano

