# Read in data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerData <- powerData[66637:69516,]
# Format Date and Time Columns
powerData$Date <- strptime(powerData$Date, format = "%d/%m/%Y")
totDate <- as.POSIXct(paste(powerData$Date, powerData$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot Data
png("Plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

# Plot 1
plot(totDate, powerData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", col = "black", xlab = "")

# Plot 2
plot(totDate, powerData$Sub_metering_1, type = "l", ylab = "Energy sub metering", col = "black", xlab = "")
lines(totDate,powerData$Sub_metering_2, col = "red")
lines(totDate,powerData$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

# Plot 3
plot(totDate, powerData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", col = "black")

# Plot 4
plot(totDate, powerData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", col = "black")
# dev.copy(png, "Plot4.png")
dev.off()