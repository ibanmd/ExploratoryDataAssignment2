## Instructions for plot2.R
## ------------------------------------------------------------------------------------
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Download and read in data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", 
              destfile="Exploratory2.zip", 
              method="curl")
unzip(zipfile="Exploratory2.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Cleaning the data prior to plotting

### --------------------------------------------------------------------------###
### Now we make the SECOND plot and save it
### --------------------------------------------------------------------------###

png("/Users/Mario/Desktop/ExploratoryDataAssignment2/plot2.png", width=600, height=600)


dev.off()