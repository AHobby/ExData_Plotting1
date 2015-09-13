# week 1 project. Recreating graphs.
# code assumes that you have downloaded the file and have 
# set the working directory to be the same as the file .

#read the data in
PowerData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,, stringsAsFactors = FALSE, na.strings="?")
head(PowerData)


#deal with date formats and subset the data
PowerData$Date <- as.Date(PowerData$Date, format="%d/%m/%Y")
dataDaysNeeded <- subset(PowerData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(dataDaysNeeded$Date), dataDaysNeeded$Time)
dataDaysNeeded$Datetime <- as.POSIXct(datetime)

# now produce the plot
png("plot2.png", width=480, height=480)
plot(dataDaysNeeded$Global_active_power, type="l", xlab="", ylab= "Global Active Power (kiloWatts)")
dev.off()
