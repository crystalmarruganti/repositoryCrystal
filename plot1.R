##read the data 
wholedata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##covert data and time to their right classes 
wholedata$Date <- as.Date(wholedata$Date, format="%d/%m/%Y")
wholedata$Time <- format(wholedata$Time, format="%H:%M:%S")
##convert all other variables into numeric variables 
wholedata$Global_active_power <- as.numeric(wholedata$Global_active_power)
wholedata$Voltage <- as.numeric(wholedata$Voltage)
wholedata$Global_intensity <- as.numeric(wholedata$Global_intensity)
wholedata$Sub_metering_1 <- as.numeric(wholedata$Sub_metering_1)
wholedata$Sub_metering_2 <- as.numeric(wholedata$Sub_metering_2)
wholedata$Sub_metering_3 <- as.numeric(wholedata$Sub_metering_3)
##create a new variable with the subset containing data from the 2 days we are interested in 
twodaysdata <- subset(wholedata, Date == "2007-02-01" | Date =="2007-02-02")
##create a png file
png("plot1.png", width=480, height=480)
##design the histogram
hist(twodaysdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)"
##quit the plotting design 
     dev.off()
     