library("datasets")
library("data.table")
library("lubridate")
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
View(household_power_consumption,)
DT=data.table(household_power_consumption)
select<-c("1/2/2007","2/2/2007")
data2<-DT[DT$Date %in% select,]
data2[,jour:=as.POSIXct(paste(as.Date(data2$Date, format="%d/%m/%Y"), data2$Time, sep=" "))]
plot(data2$jour,data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()
