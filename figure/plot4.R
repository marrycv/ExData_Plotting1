## Assignment: R codes to create plot4.png
## Included code to get data and unzip 
## Uncomment the following code if you want to download and unzip (assumes Rstudio in MAC)

#dataset_url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(dataset_url, "exdata-data.zip",method="curl")
#dateDownloaded <- date()
#unzip("exdata-data.zip", exdir = "./exdata-data")
#list.files("./exdata-data")


## Read data using read.table
powerdata<-read.table("./exdata-data/household_power_consumption.txt", 
                      na.strings = "?",header = T, sep = ";")

## Subset the data for dates 1/2/2007 and 2/2/2007 only
powerdata_sub<-powerdata[(powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007"),]

## Create a new column DateTime to combine the subset date and time, 
powerdata_sub$DateTime<-strptime(paste(powerdata_sub$Date,powerdata_sub$Time),"%d/%m/%Y%H:%M:%S")

## Check and inspect new data columns by using str(powerdata_sub) 
str(powerdata_sub)

## Create plot, open png device and specify parameters
png(filename = "plot4.png",width = 480, height = 480, bg = "transparent")

## Initialize plot and specify parameters
par(mfrow = c(2,2))
with(powerdata_sub,{
  ## subplot 1,1
  plot(DateTime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power") 
  ## subplot 1,2
  plot(DateTime, Voltage, type = "l", xlab = " datetime ", ylab = "Voltage")  
  ## subplot 2,1
  plot(DateTime, Sub_metering_1,type = "l", col = "black",        
       xlab = " ", ylab = "Energy sub metering")
    ## Add plots and annotations
    lines(DateTime, Sub_metering_2,col = "red")
    lines(DateTime, Sub_metering_3,col = "blue")
    legend("topright", lty = 1,col = c("black", "red","blue"), bty = "n",
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  ## subplot 2,2
  plot(DateTime,Global_reactive_power, type = "l", xlab = "datetime ")
})

## Close png device
dev.off()