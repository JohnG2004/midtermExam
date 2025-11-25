#this is the histogram using ggplot
library(ggplot2)

#showing the faitful dataset
faithfuldf <- data("faithful")
print(faithful)
str(faithful)

#histogram of waiting times
histogram_waiting <- ggplot(faithful, aes(x = waiting)) + geom_histogram(fill = "blue", colour = "red") +  
                        labs(title = "Histogram of Waiting Time", x = "Waiting time (minutes)", y = "Count")
show(histogram_waiting)

#KDE
kde <- ggplot(faithful, aes(x = waiting)) +
        geom_density(fill = "red") +  
        labs(title = "Density of Waiting Time",
            x = "Waiting time (minutes)",
            y = "Density")
show(kde)

#frequency polygone
freq_polygone <- ggplot(faithful, aes(x = waiting)) +
                    geom_freqpoly(bins = 10) +
                    labs(title = "Frequency Polygon of Waiting Time",
                        x = "Waiting time (minutes)",
                        y = "Count")
show(freq_polygone)