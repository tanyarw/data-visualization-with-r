library(nycflights13)
library(tidyverse)
# Remove NA values
flights_df <- na.omit(flights)

# Compute flight delay cost for every flight. And delay cost into dataset
# Hint: Cost Index=[(number of flights)*mean(delay)/mean(distance)]
library(plyr)
flights_count = count(flights_df,"flight") #number of flights
flights_df<-merge(x=flights_df,y=flights_count,by="flight",all.x=TRUE) #append count

flights_mean = ddply(flights_df, .(flight), summarize,  mean_arr_delay=mean(arr_delay), mean_distance=mean(distance))
flights_df<-merge(x=flights_df,y=flights_mean,by="flight",all.x=TRUE) #append mean

flights_df$delay_cost = flights_df$freq*flights_df$mean_arr_delay/flights_df$mean_distance #calculate cost index

# Select top 50 largest arrival delays (cost index)
select_df <- select(flights_df, "freq","mean_distance","mean_arr_delay", "delay_cost")
select_df <- unique(select_df)

top50 <- select_df %>% arrange(desc(delay_cost))
top50 <- top50[1:50,]

# convert delay cost dataframe to a matrix
# Hint: delay_mat<- delay_df.matrix(top50)
#top50 <- select(top50, "flight", , E)

delay_mat <- data.matrix(top50)

# Visualize Heat Map
# Hint: c("Flights","Distance","Delay","Cost Index")
flight_heatmap <- heatmap(delay_mat, Rowv=NA, Colv=NA,
                          col = heat.colors(256), scale="column",
                          cexCol=1,
                          labCol=c("Flights","Distance","Delay","Cost Index"),
                          xlab = "",
                          ylab = "Flight Numbers",
                          main = "Top 50 Cost Index Flights")
flight_heatmap