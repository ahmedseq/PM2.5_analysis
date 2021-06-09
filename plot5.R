SCC.sub <- SCC[grepl("Vehicle" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]


png("plot5.png", width = 400, height = 400, units = "px", bg="transparent")

plot5 <- ggplot(NEI.sub, aes(factor(year), y=Emissions, fill=type)) +
    geom_bar(stat = "identity", width = .5) + xlab("Year") +
    ylab("Vehicle Related PM2.5 Emissions") +
    ggtitle("Total Vehicle-Related PM2.5 Emissions")
print(plot5)
dev.off()

#How have emissions from motor vehicle sources changed from 1999-2008 in 
#Baltimore City?
#The amount of PM2.5 is decreasing from 1999 to 2009
