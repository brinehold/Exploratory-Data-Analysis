# Read in data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerData <- powerData[66637:69516,]
# Format Date and Time Columns
powerData$Date <- strptime(powerData$Date, format = "%d/%m/%Y")
totDate <- as.POSIXct(paste(powerData$Date, powerData$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot Data
png("Plot3.png", width = 480, height = 480)
plot(totDate, powerData$Sub_metering_1, type = "l", ylab = "Energy sub metering", col = "black", xlab = "")
lines(totDate,powerData$Sub_metering_2, col = "red")
lines(totDate,powerData$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
# dev.copy(png, "Plot3.png")
dev.off()