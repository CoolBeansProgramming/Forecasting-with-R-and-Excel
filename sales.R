#################################################
# Monthly Retail Sales Per Day
# Data has been adjusted for inflation 
# Use this data to forecast the next right months
#################################################


# load packages 
library(tidyverse)
library(readxl)
library(fpp2)

# load data from excel 
sales.df <-read_excel("sales.xlsx", 3)


# create ts object 
sales.ts <-ts(sales.df[,2], start=c(1992,1), frequency=12)

start(sales.ts)
end(sales.ts)
cycle(sales.ts)  
summary(sales.ts)

# time plot

autoplot(sales.ts) +
  ggtitle("Daily US Retail Sales") +
  xlab("Month/Year") + 
  ylab("Millions (2020 $)")


# seasonal plot
ggseasonplot(sales.ts, year.labels = TRUE, year.labels.left = TRUE) +
  xlab("Month/Year") +
  ylab("Millions (2020 ($)") +
  ggtitle("Seasonalplot of Sales")

# seasonal plot: polar coordinates
ggseasonplot(JohnsonJohnson, polar = TRUE) +
  xlab("Month/Year") +
  ylab("Millions (2020 ($)") +
  ggtitle("Seasonalplot of Sales, Polar Coordinates")

# seasonal subseries plot
ggsubseriesplot(JohnsonJohnson) +
  ylab("Millions(2020 ($)") +
  ggtitle("Seasonal subseries plot: Sales")
