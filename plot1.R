library(tidyverse)
## Reading the data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Grouping the sum of the emissions level by year

by_year<- NEI %>% group_by(year) %>% summarise(PM.Year = sum(Emissions))

#Plot Year Vs. Emissions level of PM2.5 

plot(by_year$year, by_year$PM.Year/1000, xlab = "Year", ylab = "PM2.5",
     pch = 19, frame = FALSE)
abline(h=5450, col = "blue")

#The plot shows that the emissions level of pm2.5 had decreased from 1999 to
# 2008 , and the line at 5450 in the y-axis show that the levels at
#2004-2006 is lower than the levels at 2002.