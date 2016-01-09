# Read in data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerData <- powerData[66637:69516,]
# Format Date and Time Columns
powerData$Date <- strptime(powerData$Date, format = "%d/%m/%Y")
totDate <- as.POSIXct(paste(powerData$Date, powerData$Time), format = "%Y-%m-%d %H:%M:%S")

# Generate Plot 1
png("Plot1.png", width = 480, height = 480)
hist(powerData$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
# dev.copy(png, "Plot1.png")
dev.off()