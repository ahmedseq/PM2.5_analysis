library(tidyverse)
library(ggplot2)
## Reading the data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Selecting Baltimore rows.
Baltimore <- NEI %>% filter(fips == "24510")

#Grouping the sum of the emissions level by year

by_year<- Baltimore %>% group_by(year, type) %>% summarise(PM.Year = sum(Emissions))

#Plotting
ggplot(data = by_year) +
    geom_line(mapping = aes(year, PM.Year, col=type))

#The plot shows that the decreased types are (NONPOINT, NON-ROAD and ON-ROAD),
#and the the increased type is only (POINT).