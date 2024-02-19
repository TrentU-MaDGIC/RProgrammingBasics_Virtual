# R Programming Basics: A User-Friendly Introduction
# Presented by Trent University Library's Maps, Data and Government Information Center
# Contact: madgichelp@trentu.ca 

#### Using R as a calculator #### 

# Running R code from the console (bottom left):
# In the console (bottom left pane) type: 123 + 789 
# and hit `Enter`.

# Running R code from the source pane (top right):
# with your cursor on line 15, click **Run** (top right of source pane) or 
# press  **Ctrl + Enter** or **Alt + Enter** (Command + Enter on Mac)
3 * 5

# R follows the order of operations
2 + 100 / 2 - 25 

(2 + 100) / (2 - 25)


#### Objects #### 

# Objects are created using the **assignment operator**: <-
# To the left of <- is the object name
# and to the right of <- is the value to assign

Prcp_mm_Dec312022 <- 13.2

Prcp_mm_Dec312022

prcp_mm_dec312022 # wrong case
Prc_mm_D312022 # misspelled

##### Major data types ##### 

# Numeric data: numbers with or without decimals
MeanTemp_C_Mar012023 <- -3.9
MeanTemp_C_Mar012023

# Integer: number value without decimal places
# To specify an integer, place an L at the end of the number
n_Ptbo_weatherstations <- 13L
n_Ptbo_weatherstations

# Character data: text value, always in quotations, either "" or ''
# Any text within a single pair of quotations is a single character value
Data_Source <- "Daymet"
Data_Source 

# An object's name represents the information stored in that object,
# so you can treat the object's name as if it were the assigned values
# For example: Use objects in calculations
Snow_mm_Dec242020 <- 17.26
Snow_mm_Dec252020 <- 6.84
Snow_mm_Dec262020 <- 1.96

Snow_mm_Dec242020 + Snow_mm_Dec252020 + Snow_mm_Dec262020

# Objects may be created from calculations
TotalHolidaySnowfall_mm_2020 <- Snow_mm_Dec242020 + Snow_mm_Dec252020 + Snow_mm_Dec262020
TotalHolidaySnowfall_mm_2020

##### Challenge 2 ##### 
# Which of the following would successfully create an object?

# Total_Prep_Ptbo_2015_mm <- 727.1 
# City -> "Peterborough"
# AvergTemp@2010 <- 15
# Ptbo-Precpmm-May03 <- 150


#### Functions #### 

# Functions allow users to execute simple to complex commands quickly
# Different functions require different data types

# abs() calculates the absolute value of a number
abs(-3)

# toupper() capitalizes all letters in the provided character
toupper("Hello world")

# Objects may be used in functions.
MeanTemp_C_Mar012023
Data_Source

abs(MeanTemp_C_Mar012023) 

toupper(Data_Source) 

# class(): returns the data type
class(MeanTemp_C_Mar012023)
class(Data_Source)


##### Functions: Getting Help #####

# To understand what a function does and how it works, 
# we can view the function's help page with ?

?round

MeanAnnualTemp_degC_2022 <- 7.25156
round(MeanAnnualTemp_degC_2022, digits = 2) 

# Some functions have with multiple arguments
# For example: rep(), the replicate elements function
?rep 

replicate_this <- 1:3
replicate_this

rep(replicate_this)

?seq()

seq(from = 2, to = 35, by = 5)

seq(from = 2, by = 5, length.out = 7)

##### Challenge 3: ##### 
?rnorm

# Using rnorm()'s help page, match each of rnorm()'s arguments to its definition:


# Argument:
# n
# mean
# sd
# x
# q
# lower.tail

# Definitions
# Vector of means
# Vector of standard deviations
# Number of observaitons
# Not an argument of rnorm



#### Packages #### 

# "dplyr" is a popular package for data manipulation

install.packages("dplyr") # install.packages() installs the package specified in quotations

library(dplyr) # library() loads the specified package

# Specify a specific function from a specific pacakge with package::function()
ts <- 1:100
stats::filter(ts, rep(1, 3)) # proper use of stats::filter
dplyr::filter(iris, Sepal.Length > 7) # wrong use of dplyr::filter, returns an error

# Install and load the "stringr" package with the package pane:
# The "stringr" package is used working with character (text) data
## 1. Select the **Packages** tab in the bottom right pane of RStudio.
## 2. Click Install
## 3. Enter "stringr" in the "Packages (separate multiple with space or comma)" filed.
## 4. Click Install. If no errors are returned, the package is now installed.
## 5. Load the package by checking the corresponding box in the package page

# Similar to functions, packages have help pages which are accessed through help()
# Make you use specify it is a package! 
help(package = "stringr") 

# Some packages also have official tutorials, known as Vignettes.
# To view these tutorials, use browseVignettes()
browseVignettes("stringr") 

##### Challenge 4 ##### 

# Identify the two methods to properly install a package in RStudio:

# Packages.install("package")
# install.packages("package")
# Using the Install button in the Packages tab
# Using the Help pane

# Note: attempting to run lines 177-180 will return errors. 
# These lines are not meant to be run but show the methodology

#### Data Structures #### 

##### Vectors #####

# Create vectors with combine: c()
# Vector elements are separated by commas.
Months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", 
            "Sep", "Oct", "Nov", "Dec")
Months 

MaxMonthtemp_C_Ptbo_2022 <- c(3.62, 5.07, 17.67, 23.1, 29.26, 29.55, 
                              29.14, 30.64, 25.2, 22.7, NA, 14.58)
MaxMonthtemp_C_Ptbo_2022

# Inspect vectors:
head(MaxMonthtemp_C_Ptbo_2022, n = 6)

length(MaxMonthtemp_C_Ptbo_2022)

# Individual vector values with arithmetic (i.e., add, subtract, divide) or functions 
MaxMonthtemp_C_Ptbo_2022 + 20

# log(): computes logarithms of each element, by default natural logarithms.
log(MaxMonthtemp_C_Ptbo_2022)

# tolower(): translates each character element to lower case
tolower(Months)


# Naming vector elements
MaxMonthtemp_C_Ptbo_2022 # little to no context  

# names(): assigns names to each vector element
names(MaxMonthtemp_C_Ptbo_2022) <- Months

MaxMonthtemp_C_Ptbo_2022  # now has more context


# Common statistics are calculated from vectors:
sd(MaxMonthtemp_C_Ptbo_2022)

# Something is wrong, let's look at the vector:
MaxMonthtemp_C_Ptbo_2022

?sd

sd(MaxMonthtemp_C_Ptbo_2022, na.rm = TRUE)


##### Data frames #####

# Create a data frame to work with:
Ptbo_Temps <- data.frame(Year = rep(2021, 21),
                         Month = rep("May", 21),
                         Day = 1:21,
                         MeanTemp_C = c(7.585, 6.33, 10.53, 12.32, 11.93, 11.9, 
                                        12.935, 13.395, 16.325, 18.035, 19.89, 
                                        21.22, 20.085, 15.875, 13.365, 18.945, 
                                        18.3, 11.89, 6.32, 9.23, 10.39),
                         MinTemp_C = c(1.98, 1.94, 3.2, 4.65, 3.62, 3.04, 4.14, 
                                       4.29, 6.94, 9.19, 12.15, 13.18, 15.73, 
                                       9.14, 5.62, 10.72, 12.31, 7.05, 1.88, 
                                       0.86, 1.65),
                         MaxTemp_C = c(13.19, 10.72, 17.86, 19.99, 20.24, 20.76,
                                       21.73, 22.5, 25.71, 26.88, 27.63, 29.26, 
                                       24.44, 22.61, 21.11, 27.17, 24.29, 16.73, 
                                       10.76, 17.6, 19.13),
                         Source = rep("Daymet", 21))

# As data frames get large, it can be tricky to view them in the console
# Instead use functions to show only parts of the data frame for quick reference:

# head(): returns a data frame's first six rows:
head(Ptbo_Temps, n = 6)

# str(): compactly shows the data frame's internal structure
# this includes the number of rows, columns, column names, column data types, and first few values per column.
str(Ptbo_Temps)

# View() will open the data frame in a new window 
View(Ptbo_Temps)

# Calculating statistics from data frame columns
# Placing $ after a data frame's name, allows us to isolate a single column 
mean(Ptbo_Temps$MeanTemp_C, na.rm = TRUE)

# summary() generates descriptive statistics for each numeric column
summary(Ptbo_Temps)

#### Data visualization and analysis ####

# The following will cover the basics of data visualization and analysis in R. 

# Import a .csv by prodiving the file path in read.csv()
# For reproducibility, the .csv file is hosted online
data_url <- "https://raw.githubusercontent.com/TrentU-MaDGIC/RProgrammingBasics/main/Daymet_data.csv"
daymet_data <- read.csv(url(data_url)) 

# daymet_data represents daily climate measures for Peterborough, ON and its sister city, Ann Arbor, MI from 1980 to 2022. 
# Specifically, the *daymet_data* contains the following variables (columns):
#   
# City: the city for which the daily weather data was derived. Either Peterborough, ON, or its sister city, Ann Arbor, MI
# date: Full date of daily weather value
# year: Year value was recorded
# yday: Day of the year
# dayl_s: Duration of the daylight period in seconds per day. This calculation is based on the period of the day during which the sun is above a hypothetical flat horizon
# prcp_mm_day: Daily total precipitation in millimeters per day, the sum of all forms converted to water-equivalent. Precipitation occurrence on any given day may be ascertained.
# srad_W_m2: Incident shortwave radiation flux density in watts per square meter, taken as an average over the daylight period of the day. NOTE: Daily total radiation (MJ/m2/day) can be calculated as follows: ((srad (W/m2) * dayl (s/day)) / l,000,000)
# swe_kg_m2: Snow water equivalent in kilograms per square meter. The amount of water contained within the snowpack
# tmax_degC: Daily maximum 2-meter air temperature in degrees Celsius.
# tmin_degC: Daily Daily minimum 2-meter air temperature in degrees Celsius.
# vp_Pa: Water vapor pressure in pascals. Daily average partial pressure of water vapor.

# Inspect the data:
head(daymet_data)

str(daymet_data)

# Simple data visualizations can be accomplished in R with
# the generic plotting function, plot().
# When a plot is created, it opens in the Plots pane

# Plot daily daylight and  maximum temperature:

# Plot can be used by the variable for each axis:
plot(x = daymet_data$daly_s, y = daymet_data$tmax_degC)

# Define x- and y-axis with a formula. Formulas in R follow the format: Y ~ X
plot(tmax_degC ~ daly_s, data = daymet_data)

# Add custom axis labels and change the colour: xlab, ylab, col
plot(tmax_degC ~ daly_s, data = daymet_data,
     xlab = "Daily Daylight (s)", 
     ylab = "Maximum Daily Temperature (\u00B0C)", # "u\00B0" is the unicode for the degree symbol
     col="grey")

# Change the plot type: type
plot(MeanTemp_C ~ Day, data = Ptbo_Temps,
     col="red", 
     type = "l", # type = "l" indicates a line plot
     xlab = "Day (May 2021)", 
     ylab = "Mean Daily Temperature (\u00B0C)")

# Use pre-defined plot function for quicker visualization
# hist() generates histograms
hist(daymet_data$tmax_degC, xlab = "Maximum Daily Temperature (\u00B0C)")

# boxplot() generates box plots
boxplot(tmin_degC ~ City, data = daymet_data, 
        ylab = "Minimum Daily Temperature (\u00B0C)", xlab = "City")

# Run statistical analysis:
# Pearson correlation
cor.test(daymet_data$daly_s, daymet_data$tmax_degC, method = "pearson")

# T-test
t.test(tmin_degC ~ City, data = daymet_data)