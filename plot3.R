# Reading data
df <- read.table ("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?",stringsAsFactors = FALSE )

# Subsetting
subdf <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

# For X axis
daystime <- strptime(paste(subdf$Date, " ", subdf$Time), format = "%d/%m/%Y %H:%M:%S")

# Plotting
plot(daystime, subdf$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(daystime, subdf$Sub_metering_2, col = "red")
lines(daystime, subdf$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1    ","Sub_metering_2    ","Sub_metering_3    "), lty=1,  col = c("black", "red", "blue"))

# Saving to a PNG file
dev.copy (png, file = "plot3.png", height = 480, width = 480)
dev.off()
