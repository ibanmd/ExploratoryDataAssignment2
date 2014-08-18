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

## Cleaning the data prior to plotting

### --------------------------------------------------------------------------###
### Now we make the FIFTH plot and save it
### --------------------------------------------------------------------------###

png("/Users/Mario/Desktop/ExploratoryDataAssignment2/plot5.png", width=600, height=600)


dev.off()