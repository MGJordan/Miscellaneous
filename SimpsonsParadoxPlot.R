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
  ggplot2::theme_classic() +
  ggplot2::theme(
    legend.position = "none",
    axis.text = ggplot2::element_blank(),
    axis.ticks = ggplot2::element_blank(),
    axis.title = ggplot2::element_blank())

# Generate plot with a linear regression through each species
plot.factor <- ggplot2::ggplot(
    df, 
    aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  ggplot2::geom_point() +
  ggplot2::geom_smooth(method = "lm", se = FALSE) +
  ggplot2::theme_classic() +
  ggplot2::theme(
    legend.position = "none",
    axis.text = ggplot2::element_blank(),
    axis.ticks = ggplot2::element_blank(),
    axis.title = ggplot2::element_blank())

# Save plots
ggplot2::ggsave(
  "./Downloads/simponsparadox.png",
  plot = plot.agg + plot.factor,
  width = 10,
  height = 2.5,
  units = "in")
