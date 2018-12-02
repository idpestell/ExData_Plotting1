#
# Read the data (assuming file in cwd)
#
data <- read.csv("household_power_consumption.txt", sep = ";")
#
# Subset the data for the two days and where Global active power has values
#
pdata <- subset(data, ((data$Date == "1/2/2007" | data$Date == "2/2/2007") 
                       & data$Global_active_power != "?"), 
                select = c(Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3))
#
# Convert Data and time to single date value
# Convert sub-metering fields to numeric
#
pdata[,1] <- as.POSIXct(paste(pdata$Date, pdata$Time), format="%d/%m/%Y %H:%M:%S")
pdata[,3] <- as.numeric(as.character(pdata[,3]))
pdata[,4] <- as.numeric(as.character(pdata[,4]))
pdata[,5] <- as.numeric(as.character(pdata[,5]))
#
# plot to PNG
#
png("plot3.png", width = 480, height = 480)
plot(pdata$Date, pdata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(pdata$Date, pdata$Sub_metering_1, type = "l", col="black")
points(pdata$Date, pdata$Sub_metering_2, type = "l", col="red")
points(pdata$Date, pdata$Sub_metering_3, type = "l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)
dev.off()