## Instructions for plot5.R
## ------------------------------------------------------------------------------------
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 

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

## Subset for vehicle emissions and baltimore
## These were found visually by looking at grep("Vehicle|vehicle",names(table(SCC$EI.Sector)), value=TRUE)
## Find the SCC codes which refer to vehicle emissions, and make a character vector since they are characters in NEI
vehicleSCC <- as.character(SCC[grep("Vehicle", SCC$EI.Sector),]$SCC)

## Subset NEI according to the SCC values for vehicle emissions combustion and for Baltimore
baltvehicle <- NEI[NEI$SCC %in% vehicleSCC & NEI$fips=="24510",]
baltvehicle <- data.table(baltvehicle)

## Sum Emissions by year
plot5 <- baltvehicle[,sum(Emissions), by=year]

## Add new column for Emissions measured in thousands of pounds
plot5[,V2 := round(V1/.5, 2)]

## Find out how many observations there were per year, and make into numeric vector
yearcount <- as.numeric(table(baltvehicle$year))

## New column with variable representing "average emissions per observation, in Pounds" 
plot5[,V3 := 2000*V1/yearcount]

### --------------------------------------------------------------------------###
### Now we make the FIFTH plot and save it
### --------------------------------------------------------------------------###

png("/Users/Mario/Desktop/ExploratoryDataAssignment2/plot5.png", width=600, height=600)

## Set up the first plot, Total Emissions ~ Year
plot(V2 ~ year, 
     data=plot5, 
     xlab="Year",
     ylab="",
     type="b",
     col="red",
     lwd=2,
     pch=19,
     yaxt="n",
     xaxt="n",
     ylim=c(0,4000),
     main="Total and Average Vehicle Emissions by Year (City of Baltimore)"
)

## Custom axis so that both plots look better and are easier to read
axis(side=2, at=seq(0,4000,1000))
axis(side=1, at=c(1999,2002,2005,2008))

## Label the first set of points
text(plot5[,year], plot5[,V2], labels=round(plot5[,V2],1), pos=1)

## Add the points for the second plot, Average Emissions per Observation
points(V3 ~ year, 
       data=plot5,
       type="b",
       col="blue",
       lwd=2,
       pch=19)

## Add labels to the second set of points
text(plot5[,year], plot5[,V3], labels=round(plot5[,V3],1), pos=c(3,1,3,3))

## Add a legend to the top right
legend("topright",
       legend=c("Total Vehicle Emissions, in Thousands of Pounds", "Average Vehicle Emissions per Observation, in Pounds"),
       col=c("red","blue"),
       lty=1,
       lwd=2)

dev.off()