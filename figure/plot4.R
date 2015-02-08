# data.txt must be in your working directory
# Install libraries
library("datasets")
library("data.table")
# library("lubridate")
# Upload data in initial variable
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
# Transform a data.frame to a data.table
DT=data.table(household_power_consumption)
# Define what I am looking for (subset)
select<-c("1/2/2007","2/2/2007")
# Store the result in a variable
data4<-DT[DT$Date %in% select,]
# Add a new col to my data.table
data4[,jour:=as.POSIXct(paste(as.Date(data4$Date, format="%d/%m/%Y"), data4$Time, sep=" "))]
# Number of rows and number of columns
par(mfrow=c(2,2))
# Create plot 1
plot(data4$jour,data4$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Plot 2
plot(data4$jour,data4$Voltage, type="l", xlab="datetime", ylab="Voltage")
# Plot 3
plot(data4$jour,data4$Sub_metering_1, type="l",col ="red", xlab="", ylab="Energy sub metering")
# Add a second line with the same x and y different
lines(data4$jour, data4$Sub_metering_2, type="l", col = "green")
lines(data4$jour, data4$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = "solid", col = c("red", "green", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Plot 4
plot(data4$jour,data4$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
# Copy the device screen to a device png
dev.copy(png, file="plot4.png")
# Close the connection
dev.off()
