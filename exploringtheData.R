## This script contains some of the exploratory stuff I did during the project

## Download and read in data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", 
              destfile="Exploratory2.zip", 
              method="curl")
unzip(zipfile="Exploratory2.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## How many NA's in the the SCC and NEI dataframes?
## Checking the SCC dataframe, "Map.To" has 11358, "Last.Inventory.Year" has 8972
sapply(data.frame(sapply(SCC, is.na)), sum)
## Checking the NEI dataframe, there are no NA's
sum(is.na(NEI))

## In the end that's all I really did, check and see where the NA's were.  Otherwise everything was straight forward.