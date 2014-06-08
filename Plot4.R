## Import data and subsetting

myData <- fread("household_power_consumption.txt",header = TRUE, na.strings="?", colClasses = "character")[Date == "1/2/2007" | Date =="2/2/2007"]


## add a column "date + time"
myData[,DateTime:=as.POSIXct(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")]

## create the png file
png(filename="Plot4.PNG",width = 480, height = 480)
par(mfrow = c(2,2))

## create the plot
## plot 1 top left
plot(myData$DateTime,as.numeric(myData$Global_active_power),type = "n",xlab = "", ylab ="Global Active Power")
lines(myData$DateTime,as.numeric(myData$Global_active_power),type = "l")

## plot 2 top right
plot(myData$DateTime,as.numeric(myData$Voltage),type = "n",xlab = "datetime", ylab ="Voltage")
lines(myData$DateTime,as.numeric(myData$Voltage),type = "l")

## plot 3 bottom left
plot(myData$DateTime, as.numeric(myData$Sub_metering_1) ,xlab = "",ylab ="Energy sub metering",type = "l")
lines(myData$DateTime,as.numeric(myData$Sub_metering_2),type = "l", col = "red")
lines(myData$DateTime,as.numeric(myData$Sub_metering_3),type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),pch = "-",cex = 0.9, lwd = 2)

## plot 4 bottom right
plot(myData$DateTime,as.numeric(myData$Global_reactive_power),type = "n",xlab = "datetime", ylab ="Voltage")
lines(myData$DateTime,as.numeric(myData$Global_reactive_power),type = "l")


dev.off()

