## Assignment 1: Exploratory Data Analysis, R codes to create plot1.png
## Included code to download data and unzip 
## Uncomment the following code if you want to download and unzip (assumes Rstudio in MAC)

dataset_url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "exdata-data.zip",method="curl")
dateDownloaded <- date()
unzip("exdata-data.zip", exdir = "./exdata-data")
list.files("./exdata-data")


## Read data using read.table
powerdata<-read.table("./exdata-data/household_power_consumption.txt",na.strings="?",header = T, sep = ";")

## Subset the data for dates 1/2/2007 and 2/2/2007 only
powerdata_sub<-powerdata[(powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007"),]

## Create a new column DateTime to combine the subset date and time, 
powerdata_sub$DateTime<-strptime(paste(powerdata_sub$Date,powerdata_sub$Time),"%d/%m/%Y%H:%M:%S")

## Check new data columns by using str(powerdata_sub) 
str(powerdata_sub)

## Create plot, open png device and specify parameters
png(filename = "plot1.png",width = 480, height = 480, bg = "transparent") 

## Create histogram
with(powerdata_sub,{
hist(Global_active_power,xlab="Global Active Power (kilowatts)",
     col="red",main="Global Active Power")
})

## Close png device
dev.off()


