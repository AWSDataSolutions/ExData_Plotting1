plot2 <- function() {
    ## Read Household Power Consumption
    powerdata <- read.table("household_power_consumption.txt", header=TRUE,
    sep = ";",na.strings = "?", colClasses = c("character","character",
    rep("numeric",7)),nrows =2075259)
    
    ## Subset based on date 2007-02-01 and 2007-02-02
    plotdata = subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007") 
    
    ## New Column for Date Time
    plotdata$datetime <- strptime(paste(plotdata$Date, plotdata$Time),"%d/%m/%Y %H:%M:%S")
  
    ## Plot 2
    plot(plotdata$datetime, plotdata$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="",par("lty"))
    
    ## Make a PNG Copy
    dev.copy(png, file = "plot2.png") 
    dev.off()
    
}
