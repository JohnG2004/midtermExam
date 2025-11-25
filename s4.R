#this is the s4 class using ggplot
library(methods)
library(ggplot2)

#reference class
plot <- setRefClass("plot", fields = list( x_var = "numeric", y_var = "numeric", f_var = "factor"),
    methods = list(
        initialize = function(x, y = numeric(), f = factor()) {
            # x is required
            if (missing(x)) {
                stop("You must give an x variable")
            }
            # save the values into the fields
            x_var <<- x
            y_var <<- y
            f_var <<- f

            callSuper()
        },

        #scatter plot method 
        scatter_plot = function() {
            # make small data frame for ggplot
            df <- data.frame(x = x_var, y = y_var, f = f_var)

            # simple scatter plot x vs y
            p <- ggplot(df, aes(x = x, y = y)) + geom_point() +
            labs(
                title = "Scatter plot of x vs y",
                x = "x variable",
                y = "y variable"
            )

        print(p)
        },

        #bar chart method 
        bar_chart = function(use_factor = FALSE) {

            df <- data.frame(x = x_var, f = f_var)

            if (use_factor == TRUE) {
                p <- ggplot(df, aes(x = x, fill = f)) +
                geom_bar(fill = "blue")
            } else {
                p <- ggplot(df, aes(x = x)) +
                geom_bar(fill = "red")
            }

        print(p)
        },   

        #histogram method
        hist_plot = function() {
            df <- data.frame(x = x_var)

            p <- ggplot(df, aes(x = x)) +
                geom_histogram(bins = 10, color = "black", fill  = "lightblue") +    
                labs(
                title = "Histogram of x (10 bins)",
                x = "x variable",
                y = "count"
                )

            print(p)
        }
    )
)

#testing the class
#making a simple data frame that will look nice for all 3 methods
test_df <- data.frame(
  x_value = c(5,5,5,6,6,7,7,7,7,8,9,10,10,12,12,12,15,15,20,20),
  y_value = c(20,22,21,23,24,25,26,27,27,30,31,32,33,36,36,37,40,41,43,45),
  group   = factor(c("A","A","B","A","B","A","A","B","B","A","A","B","B","A","B","B","A","A","B","B"))
)

# create object from Plot class
my_plot <- plot$new(
  x = test_df$x_value,
  y = test_df$y_value,
  f = test_df$group
)

# calling methods 
my_plot$scatter_plot()           
my_plot$bar_chart()               
my_plot$bar_chart(use_factor=TRUE) 
my_plot$hist_plot()               


