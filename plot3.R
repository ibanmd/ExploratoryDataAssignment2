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

## Cleaning the data prior to plotting

### --------------------------------------------------------------------------###
### Now we make the THIRD plot and save it
### --------------------------------------------------------------------------###

png("/Users/Mario/Desktop/ExploratoryDataAssignment2/plot3.png", width=600, height=600)


dev.off()