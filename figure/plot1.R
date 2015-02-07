# Install libraries
library("datasets")
library("data.table")
# Upload of data in initial variable
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
# View the result
View(household_power_consumption)
# Transform a data.frame to a data.table
DT=data.table(household_power_consumption)
# Define what I am looking for (subset)
select<-c("1/2/2007","2/2/2007")
# Store the result in a variable
data<-DT[DT$Date %in% select,]
# Create histogram
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# Copy the device screen to a device png
dev.copy(png, file="plot1.png")
# Close the connection
dev.off()