##open the data
wholedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##correct the class of date and time
TimeDate <- strptime(paste(wholedata$Date, wholedata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##connect time and date
wholedata <- cbind(wholedata, TimeDate)
##correct the class of the other variables 
wholedata$Date <- as.Date(wholedata$Date, format="%d/%m/%Y")
wholedata$Time <- format(wholedata$Time, format="%H:%M:%S")
wholedata$Global_active_power <-as.numeric(wholedata$Global_active_power)
wholedata$Voltage <- as.numeric(wholedata$Voltage)
wholedata$Global_intensity <- as.numeric(wholedata$Global_intensity)
wholedata$Sub_metering_1 <- as.numeric(wholedata$Sub_metering_1)
wholedata$Sub_metering_2 <- as.numeric(wholedata$Sub_metering_2)
wholedata$Sub_metering_3 <- as.numeric(wholedata$Sub_metering_3)
#create a subset of data containing only the data related to the two days we are interested in 
twodaysdata <- subset(wholedata, Date == "2007-02-01" | Date =="2007-02-02")
##create a png file
png("plot3.png", width=480, height=480)
#design the plot
with(wholedata, plot(TimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
##add to the existing plot
lines(wholedata$TimeDate, wholedata$Sub_metering_2,type="l", col= "red")
lines(wholedata$TimeDate, wholedata$Sub_metering_3,type="l", col= "blue")
##design the legend
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
##quit plotting design
dev.off()
