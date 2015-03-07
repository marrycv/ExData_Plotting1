## Assignment 1: R code for figure plot1.png
## 
## Downloading data and unzipping (code assumes Rstudio, Mac)
dataset_url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "exdata-data.zip",method="curl")
dateDownloaded <- date()
unzip("exdata-data.zip", exdir = "./exdata-data")

## Check if the files are there
list.files()

## Reading data, extracting and subsetting
powerdata<-read.table("./exdata-data/household_power_consumption.txt", 
                      na.strings="?",header = T, sep = ";")
powerdata_sub<-powerdata[(powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007"),]

## Plot the histogram, opens a grdevice and saves plot
png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
hist(powerdata_sub$Global_active_power,xlab="Global Active Power (kilowatts)",
     col="red",main="Global Active Power")
dev.off()

