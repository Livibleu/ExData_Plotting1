# Install libraries
library("datasets")
library("data.table")
library("lubridate")
# Upload data in initial variable
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
# View the result
View(household_power_consumption,)
# Transform a data.frame to a data.table
DT=data.table(household_power_consumption)
# Define what I am looking for (subset)
select<-c("1/2/2007","2/2/2007")
# Store the result in a variable
data2<-DT[DT$Date %in% select,]
# Add a new col to my data.table
data2[,jour:=as.POSIXct(paste(as.Date(data2$Date, format="%d/%m/%Y"), data2$Time, sep=" "))]
# Create plot
plot(data2$jour,data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Copy the device screen to a device png
dev.copy(png, file="plot2.png")
# Close the connection
dev.off()
