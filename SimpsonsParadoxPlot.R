# Generating two simple plots to demonstrate Simpson's paradox.

# Clear environment
rm(list=ls())

# Set working directory and load libraries
setwd("~")
library(patchwork)
library(ggplot2)
library(palmerpenguins)

# Import penguin bill length and depth data omitting NAs
df <- na.omit(palmerpenguins::penguins)

# Generate plot with a linear regression through aggregated data
plot.agg <- ggplot2::ggplot(df, aes(x = bill_length_mm, y = bill_depth_mm)) +
  ggplot2::geom_point() +
  ggplot2::geom_smooth(method = "lm", se = FALSE) +
  theme_classic() +
  theme(
    legend.position = "none",
    axis.title = element_blank())

# Generate plot with a linear regression through each species
plot.factor <- ggplot2::ggplot(
    df, 
    aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  ggplot2::geom_point() +
  ggplot2::geom_smooth(method = "lm", se = FALSE) +
  theme_classic() +
  theme(
    legend.position = "none",
    axis.title = element_blank())

# Save plots
ggplot2::ggsave(
  "./Downloads/simponsparadox.png",
  plot = plot.agg + plot.factor,
  width = 8,
  height = 4,
  units = "in")