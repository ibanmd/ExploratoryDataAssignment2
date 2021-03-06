## Instructions for plot3.R
## ------------------------------------------------------------------------------------
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999–2008 for 
## Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 
## plotting system to make a plot answer this question.

## Download and read in data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", 
              destfile="Exploratory2.zip", 
              method="curl")
unzip(zipfile="Exploratory2.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### --------------------------------------------------------------------------###
### Prep work
### --------------------------------------------------------------------------###

## Load ggplot2 and data.table
library(ggplot2)
library(data.table)

## Subset for Baltimore and make a data.table
baltimore <- subset(NEI, fips=="24510")
baltimore <- data.table(baltimore)

## Find total emissions for each combination of year and type 
plot3 <- baltimore[,sum(Emissions), by=list(year, type)]


### --------------------------------------------------------------------------###
### Now we make the THIRD plot and save it
### --------------------------------------------------------------------------###

png("/Users/Mario/Desktop/ExploratoryDataAssignment2/plot3.png", width=600, height=600)

qplot(x=year, 
      y=V1, 
      group=type, 
      geom="smooth", 
      data=plot3, 
      color=type,
      xlab="Year",
      ylab="Total Emissions in Tons",
      main="Total Emissions in Tons by Year and Type") + geom_smooth(size=2)

dev.off()