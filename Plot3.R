## Import data and subsetting

myData <- fread("household_power_consumption.txt",header = TRUE, na.strings="?", colClasses = "character")[Date == "1/2/2007" | Date =="2/2/2007"]


## add a column "date + time"
myData[,DateTime:=as.POSIXct(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")]

## create the png file
png(filename="Plot3.PNG",width = 480, height = 480)

## create the plot
plot(myData$DateTime, as.numeric(myData$Sub_metering_1) ,xlab = "",ylab ="Energy sub metering",type = "l")
lines(myData$DateTime,as.numeric(myData$Sub_metering_2),type = "l", col = "red")
lines(myData$DateTime,as.numeric(myData$Sub_metering_3),type = "l", col = "blue")

#create the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),pch = "-", lwd = 3)

dev.off()

