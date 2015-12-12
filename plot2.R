# Reading data
df <- read.table ("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?",stringsAsFactors = FALSE )

# Subsetting
subdf <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

# For X axis
daystime <- strptime(paste(subdf$Date, " ", subdf$Time), format = "%d/%m/%Y %H:%M:%S")

# Plotting
plot(daystime, subdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Saving to a PNG file
dev.copy (png, file = "plot2.png", height = 480, width = 480)
dev.off()
