#
# Read the data (assuming file in cwd)
#
data <- read.csv("household_power_consumption.txt", sep = ";")
#
# Subset the data for the two days and where Global active power has values
#
pdata <- subset(data, ((data$Date == "1/2/2007" | data$Date == "2/2/2007") 
                       & data$Global_active_power != "?"), select = c(Date,Time,Global_active_power))
#
# Convert data and time to single entry
# Convert Global_active_power to numeric
#
pdata[,1] <- as.POSIXct(paste(pdata$Date, pdata$Time), format="%d/%m/%Y %H:%M:%S")
pdata[,3] <- as.numeric(as.character(pdata[,3]))

#
# Plot to PNG
# 
png("plot2.png")
plot(pdata$Date, pdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()