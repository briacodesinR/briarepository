[Article from Plant Disease](https://doi.org/10.1094/PDIS-06-21-1253-RE)

[Link to Coding Challenge
4](https://github.com/briacodesinR/briarepository/blob/dac3fd8fb278c1f325965e1455ecc22745911d58/PLPA6820_CodingChallenge4/PLAP6820_CodingChallenge4.md)

## Question 2a: Explain the following concepts

- YAML Header: gives information on the file title, author, data, and
  output.My YAML header has my name, shows that I created my R markdown
  file today, and that it will render as a word document.

- Literate programming: allows individuals to understand the purpose of
  your code and different steps by combining the programming language
  with daily language.

## Question 2b: Read the data using a relative file path

``` r
library(ggplot2)
library(ggpubr)
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.2.0     ✔ readr     2.2.0
    ## ✔ forcats   1.0.1     ✔ stringr   1.6.0
    ## ✔ lubridate 1.9.5     ✔ tibble    3.3.1
    ## ✔ purrr     1.2.1     ✔ tidyr     1.3.2
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(rmarkdown)
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

Mycotoxin <- read.csv("MycotoxinData.csv", na.strings="na")
```

## Question 2c: Make a separate code chunk for the figures plotting the data

### Plot 1

``` r
Plot_1 <- ggplot(Mycotoxin, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width = 0.6), color = "#009E73") + # coloring points, setting jitter and jitter width
  scale_fill_manual(values=c("#F0E442", "#0072B2")) + # filling and coloring boxplots
  xlab("") + # labeling x-axis
  ylab("DON(ppm)") + # labeling y-axis
  theme_classic() + # classic theme
  facet_wrap(~Cultivar) # faceted by Cultivar
Mycotoxin$Treatment<- as.factor(Mycotoxin$Treatment)
Mycotoxin$Treatment<- factor(Mycotoxin$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70")) # moving the x-labels around
Plot_1t <- Plot_1 +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
plot(Plot_1t)
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](PLAP6820_CodingChallenge4_files/figure-gfm/Plot_1-1.png)<!-- -->

### Plot 2

``` r
Plot_2 <- ggplot(Mycotoxin, aes(x = Treatment, y = X15ADON, color = Cultivar, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width = 0.6), color = "#009E73") + # coloring points, setting jitter and jitter width
  scale_fill_manual(values=c("#F0E442", "#0072B2")) + # filling and coloring boxplots
  xlab("") + # labeling x-axis
  ylab("15ADON") + # labeling y-axis
  theme_classic() + # classic theme
  facet_wrap(~Cultivar) # faceted by Cultivar
Plot_2t <- Plot_2 +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
plot(Plot_2t)
```

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](PLAP6820_CodingChallenge4_files/figure-gfm/Plot_2-1.png)<!-- -->

### Plot 3

``` r
Plot_3 <- ggplot(Mycotoxin, aes(x = Treatment, y = MassperSeed_mg, color = Cultivar, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width = 0.6), color = "#009E73") + # coloring points, setting jitter and jitter width
  scale_fill_manual(values=c("#F0E442", "#0072B2")) + # filling and coloring boxplots
  xlab("") + # labeling x-axis
  ylab("Seed Mass (mg)") + # labeling y-axis
  theme_classic() + # classic theme
  facet_wrap(~Cultivar) # faceted by Cultivar
Plot_3t <- Plot_3 +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
plot(Plot_3t)
```

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](PLAP6820_CodingChallenge4_files/figure-gfm/Plot_3-1.png)<!-- -->

### Combined Plots

``` r
ggarrange( # combining the plots
  Plot_1t,
  Plot_2t,
  Plot_3t,
  ncol = 3,
  nrow=1,
  labels = "auto", # labeling the subplots as a, b, and c
  common.legend = TRUE # RESPONSE TO QUESTION 4: common.legend gives all the plots one legend when their keys contain the same items.
  )
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](PLAP6820_CodingChallenge4_files/figure-gfm/Combined_Plots-1.png)<!-- -->
