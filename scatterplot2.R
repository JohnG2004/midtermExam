# This is the scatter plot using ggplot library
library(gcookbook)
library(ggplot2)

# Load the heightweight dataset
heightweightdf <- data("heightweight")
print(heightweight)
str(heightweight)

#printing out the correlation
numeric_heightweightdf <- heightweight[, sapply(heightweight, is.numeric)]
correlation_matrix <- cor(numeric_heightweightdf, method = "pearson", use = "complete.obs")
print(correlation_matrix)

# Basic scatter plot of height vs weight, grouped by sex
scatter_plot_heightweight <- ggplot(heightweight, aes(x = heightIn, y = weightLb, colour = sex)) + geom_point(aes(shape = sex)) +                        
            stat_smooth(method = "lm", se = FALSE, level = 0.97, aes(group = sex)) +        
            labs(title = "Height vs Weight by Gender", x = "Height (inches)", y = "Weight (pounds)")
show(scatter_plot_heightweight)