library(tidyverse)
## Reading the data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Selecting Baltimore rows.
Baltimore <- NEI %>% filter(fips == "24510")

#Grouping the sum of the emissions level by year

by_year<- Baltimore %>% group_by(year) %>% summarise(PM.Year = sum(Emissions))

#Plotting

barplot(height=by_year$PM.Year/1000, names.arg = by_year$year, xlab = "Year",
        ylab = "PM2.5' Level", main ="PM2.5 Level in Baltimore" )
#The plot shows that the PM2.5 Level in Baltimore had decreased in 2002,
#then it went back to increase in 2005, then another decrease in 2008,
#so the answer to the questions is yes PM2.5 Level in Baltimore had decreased,
#from 1999 to 2008.