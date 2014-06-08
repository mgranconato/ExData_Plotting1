## Import data and subsetting

myData <- fread("household_power_consumption.txt",header = TRUE, na.strings="?", colClasses = "character")[Date == "1/2/2007" | Date =="2/2/2007"]


## add a column "date + time"
myData[,DateTime:=as.POSIXct(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")]

## plot
png(filename="Plot1.PNG",width = 480, height = 480)
hist(as.numeric(myData$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()

