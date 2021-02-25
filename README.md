# Data Visualization
CSE3020 Data Visualization using R

## AST01
Consider the following transportation dataset of three districts. It describes district code, District name, Transport mode, Total population and people who drove alone<br>
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
- Count the number of selfdrive in each district.
- Print max and min of pop_total.
- Derive new information/print "percentage of people who drove alone in all three districts" and also rank districts based on the % of people who used bicycle.
<hr>
