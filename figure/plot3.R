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
data3<-DT[DT$Date %in% select,]
# Add a new col to my data.table
data3[,jour:=as.POSIXct(paste(as.Date(data3$Date, format="%d/%m/%Y"), data3$Time, sep=" "))]
# Create plot
plot(data3$jour,data3$Sub_metering_1, type="l",col ="red", xlab="", ylab="Energy sub metering")
# Add a second line with the same x and y different
lines(data3$jour, data3$Sub_metering_2, type="l", col = "green")
lines(data3$jour, data3$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = "solid", col = c("red", "green", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Copy the device screen to a device png
dev.copy(png, file="plot3.png")
# Close the connection
dev.off()
