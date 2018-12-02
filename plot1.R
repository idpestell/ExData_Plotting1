#
# Read the data (assuming file in cwd)
#
data <- read.csv("household_power_consumption.txt", sep = ";")
#
# Subset the data for the two days and where Global active power has values
#
pdata <- subset(data, ((data$Date == "1/2/2007" | data$Date == "2/2/2007") 
                       & data$Global_active_power != "?"), select = Global_active_power)
#
# Convert Global_active_power to numeric
#
pdata[,1] <- as.numeric(as.character(pdata[,1]))
#
# Plot to png
#
png("plot1.png", width = 480, height = 480)
hist(pdata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()