plot1 <- function() {
    ## Read Household Power Consumption
    powerdata <- read.table("household_power_consumption.txt", header=TRUE,
    sep = ";",na.strings = "?", colClasses = c("character","character",
    rep("numeric",7)),nrows =2075259)
    
    ## Subset based on date 2007-02-01 and 2007-02-02
    plotdata = subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007") 
      
    ## Plot 1
    hist(plotdata$Global_active_power,main = "Global Active Power",col="RED",
    xlab="Global Active Power (kilowatts)")
    
    ## Make a PNG Copy
    dev.copy(png, file = "plot1.png") 
    dev.off()
    
}
