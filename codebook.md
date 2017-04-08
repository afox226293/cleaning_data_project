# Getting and Cleaning Data Project - Codebook
## Overview
Information on the output of ```run_analysis.R```

## Variables
The output from ```tidyoutput.txt``` containts 68 variables.  Column 1 contains the indentifier for the subject of the experiment and Column 2 contains the description of the activity they are completing.  Columns 3:68 contain summary measurements obtained whilst the subject was completing the activity calculated using the function `mean()`.  The names of the variables 3:68 contain information pertaining to the characteristics of that measurement:  

* time / frequency - indicates a time signal (captured at 50hz) or an acceleration signal
* Body / Gravity - indicates whether the acceleration signal was a body or gravitational signal
* Accelerometer / Gyroscope - indicates the type of sensor that captured the measurement
* .mean / .std - indicates whether the resulting observation was a mean average or a standard deviation
* ...X / ...Y / ...Z - indicates the axis of measurement

## Summary considerations
Of the data that was origianlly recorded only that related to the mean or standard deviation has been included in the summary output.  The tidy data set also groups observations by subject and activity and provides a mean average of the variables recorded for that activity.  Each subject 1:30 has a summary for each of the 6 activities hence the total of 180 observations.  Data is provided in a short and wide format to allow for each observation to relate to a different subject/activity.
