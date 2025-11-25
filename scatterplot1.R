# This is the scatter plot without using ggplot library
library(gcookbook)

# Load the heightweight dataset
heightweightdf <- data("heightweight")
print(heightweight)
str(heightweight)

#printing out the correlation
numeric_heightweightdf <- heightweight[, sapply(heightweight, is.numeric)]
correlation_matrix <- cor(numeric_heightweightdf, method = "pearson", use = "complete.obs")
print(correlation_matrix)

#results for the correlation
#            ageYear  ageMonth  heightIn  weightLb
# ageYear  1.0000000 0.9999984 0.6518749 0.6081698
# ageMonth 0.9999984 1.0000000 0.6519673 0.6081694
# heightIn 0.6518749 0.6519673 1.0000000 0.7767288
# weightLb 0.6081698 0.6081694 0.7767288 1.0000000

# ageYear vs ageMonth correlation of 0.9999984
scatter_plot <- plot(heightweight$ageYear, heightweight$ageMonth,
     xlab = "Age (years)", ylab = "Age (months)",
     main = "ageYear vs ageMonth")
show(scatter_plot)

# heightIn vs weightLb correlation of 0.7767288
# scatter_plot <- plot(heightweight$heightIn, heightweight$weightLb,
#      xlab = "Height (Inches)", ylab = "Weight (pounds)",
#      main = "heightIn vs weightLb")
# show(scatter_plot)


