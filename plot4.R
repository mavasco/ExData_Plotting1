# Reading data
df <- read.table ("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?",stringsAsFactors = FALSE )

# Subsetting
subdf <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

# For X axis
daystime <- strptime(paste(subdf$Date, " ", subdf$Time), format = "%d/%m/%Y %H:%M:%S")

# Plotting
par(mfcol= c(2,2))

plot(daystime, subdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(daystime, subdf$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(daystime, subdf$Sub_metering_2, col = "red")
lines(daystime, subdf$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1    ","Sub_metering_2    ","Sub_metering_3    "), lty=1,  bty = "n", col = c("black", "red", "blue"))

plot(daystime, subdf$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

plot(daystime, subdf$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Saving to a PNG file
dev.copy (png, file = "plot4.png", height = 480, width = 480)
dev.off()
