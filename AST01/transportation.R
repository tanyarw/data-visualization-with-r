# a. Create dataframe for the above data
transp.data <- data.frame(
  d_code = c(45, 45, 78, 78, 78, 78, 111, 111, 111),
  district = c("Ranipet", "Ranipet", "Thirupatthur", "Thirupatthur", "Thirupatthur", "Thirupatthur", "Vellore", "Vellore", "Vellore"),
  transp_mode = c("Bicycle", "Bike", NA, NA, "Bicycle", NA, "Car", "Bicycle", "Bike"),
  pop_total = c(73560, 1634923, 797818, 3865125, 42880, 7710301, 373402, 27313, 14525322),
  selfdrive_total = c(2414, 42902, 21348, 75246, 1088, 399041, 13922, 1075, 557036),
  stringsAsFactors = FALSE
)
print(transp.data)

# b. How many observations of 'district' are missing from the dataframe
sum(is.na(transp.data))

# c. Count the number of selfdrive in each district.
tapply(transp.data$selfdrive_total, transp.data$district, FUN=sum)

# d. Print max and min of pop_total.
print(max(transp.data$pop_total))
print(min(transp.data$pop_total))

# e. Derive new information/print "percentage of people who drove alone in all three districts"  
x<-aggregate(transp.data$selfdrive_total, by=list(Category=transp.data$district), FUN=sum)
y<-aggregate(transp.data$pop_total, by=list(Category=transp.data$district), FUN=sum)
cat(x$Category,"\n",x$x/y$x*100)

#rank districts based on the % of people who used bicycle.
transp.data$selfdrive_percent <- transp.data$selfdrive_total/transp.data$pop_total*100
BicycleDf<- transp.data[transp.data$transp_mode=='Bicycle',]
result<-aggregate(BicycleDf$selfdrive_percent, by=list(Category=BicycleDf$district), FUN=sum)
result2<- result[order(result$x),]
result2
rank(result$x)
