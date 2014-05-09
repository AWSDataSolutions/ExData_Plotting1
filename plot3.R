plot3 <- function() {
    ## Read Household Power Consumption
    powerdata <- read.table("household_power_consumption.txt", header=TRUE,
    sep = ";",na.strings = "?", colClasses = c("character","character",
    rep("numeric",7)),nrows =2075259)
    
    ## Subset based on date 2007-02-01 and 2007-02-02
    plotdata = subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007") 
    
    ## New Column for Date Time
    plotdata$datetime <- strptime(paste(plotdata$Date, plotdata$Time),"%d/%m/%Y %H:%M:%S")
  
    ## Plot 3
    plot(plotdata$datetime, plotdata$Sub_metering_1, ylab="Energy sub metering",xlab="",par("lty"))
    lines(plotdata$datetime, plotdata$Sub_metering_2, col = "red")
    lines(plotdata$datetime, plotdata$Sub_metering_3, col = "blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
    
    ## Make a PNG Copy
    dev.copy(png, file = "plot3.png") 
    dev.off()
    
}
