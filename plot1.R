## Instructions for plot1.R
## ------------------------------------------------------------------------------------
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all 
## sources for each of the years 1999, 2002, 2005, and 2008.

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

## Load package
library(data.table)

## Convert to data table
NEI <- data.table(NEI)

## Sum Emissions by year
plot1 <- NEI[,sum(Emissions), by=year]

## Add new column for Emissions measured in millions of tons (instead of tons as in V1)
plot1[,V2 := round(V1/1000000, 2)]

## Find out how many observations there were per year, and make into numeric vector
yearcount <- as.numeric(table(NEI$year))

## New column with variable representing "average emissions per observation, in tons" 
plot1[,V3 := round(V1/yearcount,2)]


### --------------------------------------------------------------------------###
### Now we make the FIRST plot and save it
### --------------------------------------------------------------------------###

png("/Users/Mario/Desktop/ExploratoryDataAssignment2/plot1.png", width=600, height=600)

## Set up the first plot, Total Emissions ~ Year
plot(V2 ~ year, 
     data=plot1, 
     xlab="Year",
     ylab="",
     type="b",
     col="red",
     lwd=2,
     pch=19,
     yaxt="n",
     xaxt="n",
     ylim=c(0,8),
     main="Total and Average Emissions by Year"
     )

## Custom axis so that both plots look better and are easier to read
axis(side=2, at=0:8)
axis(side=1, at=c(1999,2002,2005,2008))

## Label the first set of points
text(plot1[,year], plot1[,V2], labels=round(plot1[,V2],1), pos=3)

## Add the points for the second plot, Average Emissions per Observation
points(V3 ~ year, 
      data=plot1,
      type="b",
      col="blue",
      lwd=2,
      pch=19)

## Add labels to the second set of points
text(plot1[,year], plot1[,V3], labels=round(plot1[,V3],1), pos=1)

## Add a legend to the top right
legend("topright",
       legend=c("Total Emissions, in Millions of Tons", "Average Emissions per Observation, in Tons"),
       col=c("red","blue"),
       lty=1,
       lwd=2)

dev.off()