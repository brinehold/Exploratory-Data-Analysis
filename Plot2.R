# Read in data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerData <- powerData[66637:69516,]
# Format Date and Time Columns
powerData$Date <- strptime(powerData$Date, format = "%d/%m/%Y")
totDate <- as.POSIXct(paste(powerData$Date, powerData$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot Data
png("Plot2.png", width = 480, height = 480)
plot(totDate, powerData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", col = "black", xlab = "")
# dev.copy(png, "Plot2.png")
dev.off()