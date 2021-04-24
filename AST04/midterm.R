library(plotly)
library(ggplot2)
library(tidyverse)
library(dplyr)
require(maps)
require(viridis)
library(listviewer)

#mean summary
v = iris %>% 
  group_by(Species) %>%
  summarise_if(is.numeric, mean)
v

#stacked chart
p1 <- plot_ly(data = iris, type = 'bar',x=~Species, y=~Sepal.Length, name = 'Sepal Length')%>%
  add_trace(y=~Petal.Length, name = 'SPetal Length')%>%
  layout(barmode='stack')
p1 <- p1 %>% layout(title = 'Species Dimensions', yaxis = list(title = list(text= 'Length')), xaxis = list(title = list(text = 'Species')))
p1

#horizontal bars
p2 <- plot_ly(data = iris, type = 'bar',x=~Sepal.Width, y=~Sepal.Length,  orientation = 'h')
p2 <- p2 %>% layout(title = 'Sepal Dimensions', yaxis = list(title = list(text= 'Length of Sepal'),zeroline = FALSE), xaxis = list(title = list(text = 'Width of Sepal'),zeroline = FALSE))
p2
#scatter plot
p3 <- plot_ly(data = iris, x = ~Petal.Width, y = ~Petal.Length, type = 'scatter', mode = 'markers', color=~Species, size=~Sepal.Width ,hovertext=~Sepal.Width)
p3 <- p3 %>% layout(title = 'Petal Dimensions', yaxis = list(title = list(text= 'Length of Petal'),zeroline = FALSE), xaxis = list(title = list(text = 'Width of Petal'),zeroline = FALSE))

max_len <- iris[which(iris$Petal.Length== max(irist$Petal.length))]
p3