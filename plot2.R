##open the data
wholedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##change the format of date and time 
TimeDate <- strptime(paste(wholedata$Date, wholedata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##connect date and time
wholedata <- cbind(wholedata, TimeDate)
##change the format of the variables
wholedata$Date <- as.Date(wholedata$Date, format="%d/%m/%Y")
wholedata$Time <- format(wholedata$Time, format="%H:%M:%S")
wholedata$Global_active_power <-as.numeric(wholedata$Global_active_power)
wholedata$Voltage <- as.numeric(wholedata$Voltage)
wholedata$Global_intensity <- as.numeric(wholedata$Global_intensity)
wholedata$Sub_metering_1 <- as.numeric(wholedata$Sub_metering_1)
wholedata$Sub_metering_2 <- as.numeric(wholedata$Sub_metering_2)
wholedata$Sub_metering_3 <- as.numeric(wholedata$Sub_metering_3)
##create a subset of data containing only the 2 days we are interested in 
twodaysdata <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")
##create a png file
png("plot2.png", width=480, height=480)
##design the plot
with(twodaysdata, plot(TimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
##quit plotting
dev.off()


