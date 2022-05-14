flight <- read.csv("AirlineDelayCauses.csv")

# load the required datasets
library(dplyr)
library(plotly)
library(ggplot2)
library(ggtext)


us_flights <- as.data.frame(flight)
# structure of the data
us_flights %>%
  str()

# summary
us_flights %>%
  summary()
# view first few observations
us_flights %>%
  head()

#Assigning row names to object
carriers = rownames(us_flights)

us_flights = us_flights %>%
  mutate(carrier=carriers)

str(us_flights)
# menu itemm 2 visualization
#creating a histogram and boxplot for distribution tabpanel

p1 = us_flights %>%
  plot_ly() %>%
  add_histogram(~TotalOperations) %>%
  layout(xaxis = list(title = "TotalOperations"))

#box plot
p2 = us_flights %>%
  plot_ly() %>%
  add_boxplot(~TotalOperations) %>% 
 layout(yaxis = list(showticklabels = F))

  # stack plot
subplot(p2, p1, nrows = 2) %>%
  hide_legend() %>%
layout(title ="Distribution chart - Histogram and Boxplot",
       yaxis =list(title = "Frequency"))

#choices for selectInput - without carrier column
c1 = us_flights %>%
  select(-"carrier") %>%
  names()



