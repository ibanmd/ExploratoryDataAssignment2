## Instructions for plot6.R
## ------------------------------------------------------------------------------------
## Compare emissions from motor vehicle sources in Baltimore City with emissions from 
## motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city 
## has seen greater changes over time in motor vehicle emissions?

## Download and read in data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", 
              destfile="Exploratory2.zip", 
              method="curl")
unzip(zipfile="Exploratory2.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Cleaning the data prior to plotting

### --------------------------------------------------------------------------###
### Now we make the SIXTH plot and save it
### --------------------------------------------------------------------------###

png("/Users/Mario/Desktop/ExploratoryDataAssignment2/plot6.png", width=600, height=600)


dev.off()