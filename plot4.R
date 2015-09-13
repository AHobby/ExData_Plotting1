# week 1 project. Recreating graphs.
# code assumes that you have downloaded the file and have 
# set the working directory to be the same as the file .

#read the data in
PowerData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,, stringsAsFactors = FALSE, na.strings="?")

#deal with date formats and subset the data
PowerData$Date <- as.Date(PowerData$Date, format="%d/%m/%Y")
dataDaysNeeded <- subset(PowerData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(dataDaysNeeded$Date, dataDaysNeeded$Time, sep=" ")

dataDaysNeeded$Datetime <- as.POSIXct(datetime)
colnames(dataDaysNeeded)

global_activePower <- as.numeric(dataDaysNeeded$Global_active_power)
sub_metering1 <- as.numeric(dataDaysNeeded$Sub_metering_1)
sub_metering2 <- as.numeric(dataDaysNeeded$Sub_metering_2)
sub_metering3 <- as.numeric(dataDaysNeeded$Sub_metering_3)
voltage <- as.numeric(dataDaysNeeded$Voltage)
global_reactivePower <- as.numeric(dataDaysNeeded$Global_reactive_power)




# now produce the plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataDaysNeeded, {
        plot(Datetime, global_activePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        
        
        plot(Datetime, voltage, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Datetime, sub_metering1, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Datetime, sub_metering2,col='Red')
        lines(Datetime, sub_metering3,col='Blue')
        
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Datetime, global_reactivePower, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()