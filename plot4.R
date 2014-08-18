## Instructions for plot4.R
## ------------------------------------------------------------------------------------
## Across the United States, how have emissions from coal combustion-related sources 
## changed from 1999–2008?

## Download and read in data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", 
              destfile="Exploratory2.zip", 
              method="curl")
unzip(zipfile="Exploratory2.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Cleaning the data prior to plotting

### --------------------------------------------------------------------------###
### Now we make the FOURTH plot and save it
### --------------------------------------------------------------------------###

png("/Users/Mario/Desktop/ExploratoryDataAssignment2/plot4.png", width=600, height=600)


dev.off()