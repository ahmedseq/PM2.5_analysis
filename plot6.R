library(tidyverse)
library(ggplot2)

## Reading the data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Selecting the related Vehicle rows

SCC.sub <- SCC[grepl("Vehicle" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]

NEI_Bal_NYE <- subset(NEI, fips == "06037" | fips == "24510")
#Plotting

png("plot6.png", width = 400, height = 400, units = "px", bg="transparent")


plot6 <- ggplot(NEI_Bal_NYE, aes(factor(year), y=Emissions, fill=fips)) +
    geom_bar(stat = "identity", width = .5) + xlab("Year") +
    ylab("Vehicle Related PM2.5 Emissions") +
    ggtitle("Baltimore Vs. New Yourk")

print(plot6)
dev.off()

#How have emissions from motor vehicle sources changed from 1999-2008 in 
#Baltimore City?
#The amount of PM2.5 is decreasing from 1999 to 2008.