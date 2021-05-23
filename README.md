# Data Visualization
Data Visualization with R programming

## Assignment 1 [AST01]
Consider the following transportation dataset of three districts. It describes district code, District name, Transport mode, Total population and people who drove alone <br>
<table>
  <tr>
    <th>D_code</th>
    <th>District</th> 
    <th>Transport Mode</th>
    <th>Pop_total</th>
    <th>Selfdrive_total</th>
  </tr>
  <tr>
    <td>45 <td>Ranipet</td> <td>Bicycle</td> <td>73560</td> <td>2414</td>
  </tr>
  <tr>
    <td>45</td> <td>Ranipet</td> <td>Bike</td> <td>1634923</td> <td>42902</td>
  </tr>
  <tr>
    <td>78</td> <td>Thirupatthur</td> <td></td> <td>797818</td> <td>21348</td>
  </tr>
  <tr>
    <td>78</td> <td>Thirupatthur</td> <td></td> <td>3865125</td> <td>75246</td></tr>
  <tr>
    <td>78</td> <td>Thirupatthur</td> <td>Bicycle</td> <td>42880</td> <td>1088</td>
  </tr>
  <tr>
    <td>78</td> <td>Thirupatthur</td> <td></td> <td>7710301</td> <td>399041</td>
  </tr>
  <tr>
    <td>111</td> <td>Vellore</td>  <td>Car</td> <td>373402</td> <td>13922</td>
  </tr>
  <tr>
    <td>111</td> <td>Vellore</td> <td>Bicycle</td> <td>27313</td> <td>1075</td>
  </tr>
  <tr>
  <td>111</td> <td>Vellore</td> <td>Bike</td> <td>14525322</td> <td>557036</td>
  </tr>
</table>

Write R code for the below questions
- Create data frame for the above data
- How many observations of ‘district’ are missing from the dataframe
- Count the number of selfdrive in each district
- Print max and min of pop_total
- Derive new information/print "percentage of people who drove alone in all three districts" and also rank districts based on the % of people who used bicycle
<hr>


## Assignment 2 [AST02]
The file "EconomistData.csv" contains information about Human Development Index and Corruption Perception Index. Perform the following plotting tasks using R
- Create stacked bar chart for Rank (group based on Region)
- Create a scatter plot with CPI on the x axis and HDI on the y axis
- Color the points green. 
- Map the color of the points to Region. 
- Make the points bigger by setting size to 4 
- Map the size of the points to HDI.Rank 
- Mapping Data to Symbols 
- HDI.Rank-Data Labels on Hover 
- a. Add an appropriate title to the plot using the layout function and title argument <br>
  b. Add an appropriate x-axis label using the xaxis argument. xaxis takes a list of attribute values<br>
  c. Add an appropriate y-axis label <br>
- Display annotations for country which top and lowest HDI.Rank
- Display annotations for our country (data label with HDI.Rank)
- Save plot
<hr>

## Assignment 3 [AST03]
The file "books.csv" contains information about a collection of books. Use the GGPLOT2 library to execute the following.
- Remove NA values
- Visualize frequency distribution of checkouts in the book dataset
- Visualize boxplot plot high usage books by call number class (Hint: derive new variable high usage books which have more than 10 checkouts) and color by subCollection- any three category
- Visualize stacked bar and group chart high usage books by call number class (Hint: derive new variable high usage books which have more than 10 checkouts) and color by subCollection- any four category
- Create a bar plot that depicts the number of items in each sub-collection, faceted by format. Arrange sub plots horizontally
- Apply various themes in the above plots
<hr>

## Assignment 4 [AST04]
Consider the iris data set in the plotly package
- Calculate the mean values for the Species components of the first four columns in the iris data set. Organize the results in a matrix where the row names are the unique values from the iris Species column and the column names are the same as in the first four iris columns
- Generate two bar plots: one with stacked bars and one with horizontally arranged bars by taking necessary attributes
- Generate scatter plot: Map a continuous variable to colour, size, and shape 
<hr>

## Assignment 5 [AST05]
Consider "nycflights13" — flights dataset
- Remove NA values
- Compute flight delay cost for every flight. Add delay cost into dataset. Hint: Cost Index=(number of flights)*mean(delay)/mean(distance)
- Select top 50 largest arrival delays
- Convert delay cost dataframe to a matrix. Hint: delay_mat<- delay_df.matrix(top50)
- Visualize Heat Map. Hint: c("Flights","Distance","Delay","Cost Index")
