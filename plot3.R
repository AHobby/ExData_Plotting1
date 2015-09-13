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



#select the data to go on the plot
sub_metering1 <- as.numeric(dataDaysNeeded$Sub_metering_1)
sub_metering2 <- as.numeric(dataDaysNeeded$Sub_metering_2)
sub_metering3 <- as.numeric(dataDaysNeeded$Sub_metering_3)



# now produce the plot
png("plot3.png", width=480, height=480)
with(dataDaysNeeded, {
        plot(Datetime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
        lines(Datetime, sub_metering2, type="l", col="red")
        lines(Datetime, sub_metering3, type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))        
        })

dev.off()


