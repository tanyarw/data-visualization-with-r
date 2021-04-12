economist <- read.csv(file = 'EconomistData.csv')
economist
library(plotly)

# Create stacked bar chart for Rank(group based on Region).
plot_ly(data = economist, type = 'bar',x=~Region, y=~HDI.Rank, name="Rank" )%>%
  add_trace(y=~HDI, name = 'Human Development Index')%>%
  add_trace(y=~CPI, name = 'Corruption Perception Index')%>%
  layout(barmode='stack')

#Create a scatter plot with CPI on the x axis and HDI on the y axis.
p <- plot_ly(data= economist, x = ~CPI, y = ~HDI)
p

#Color the points green.
p = plot_ly(data=economist,x =~CPI, y=~HDI, type = 'scatter', mode = 'markers', color = I('green'))
p

# Map the color of the points to Region.
p <- plot_ly(data= economist, x = ~CPI, y = ~HDI, type = 'scatter', mode = 'markers',color =~Region)
p

# Make the points bigger by setting size to 4
p <- plot_ly(data= economist, x = ~CPI, y = ~HDI, type = 'scatter', mode = 'markers',
                color =~Region, size=4)
p

# Map the size of the points to HDI.Rank
p <- plot_ly(data= economist, x = ~CPI, y = ~HDI, type = 'scatter', mode = 'markers',
             color =~Region, size=~HDI.Rank)
p

# Mapping Data to Symbols
p <- plot_ly(data= economist, x = ~CPI, y = ~HDI, type = 'scatter', mode = 'markers',
             color =~Region, symbol =~Region, symbols = c('cross','triangle-down','circle','triangle-up','star','square'))
p

# HDI.Rank-Data Labels on Hover
p <- plot_ly(data = economist, x = ~CPI, y = ~HDI, type = 'scatter', mode = 'markers',
                color =~Region, hovertext= ~HDI.Rank)
p

# a. Add an appropriate title to the plot using the layout function and title argument.
# b. Add an appropriate x-axis label using the xaxis argument. xaxis takes a list of attribute values.
# c. Add an appropriate y-axis label.
p <- p %>% layout(title = 'HDI vs CPI',
                  yaxis = list(title = list(text= 'Human Development Index'),zeroline = FALSE),
                  xaxis = list(title = list(text = 'Corruption Perception Index'),zeroline = FALSE))
p

# Display annotations for country which top and lowest HDI.Rank
ranks <- economist[which(economist$HDI.Rank== max(economist$HDI.Rank) | economist$HDI.Rank== min(economist$HDI.Rank)), ]
ranks
p <- p %>% add_annotations(x = ranks$CPI, y = ranks$HDI, text = ranks$Country, xref = "x", yref = "y",
  showarrow = TRUE, arrowhead = 5, ax = -20, ay = -40)
p

# Display annotations for our country (data label with HDI.Rank)
our_country <- economist[which(economist$Country== "India"), ]
our_country

p <- plot_ly(data = economist, x = ~CPI, y = ~HDI, type = 'scatter', mode = 'markers',
             color =~Region)
p <- p %>% add_annotations(x = our_country$CPI, y = our_country$HDI, text = paste(our_country$Country,our_country$HDI.Rank, sep=" "), xref = "x", yref = "y",
                           showarrow = TRUE, arrowhead = 5, ax = -20, ay = -40)
p


# Save plot
htmlwidgets::saveWidget(p, "index.html")