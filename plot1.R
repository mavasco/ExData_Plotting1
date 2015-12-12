# Reading data
df <- read.table ("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?",stringsAsFactors = FALSE )

# Subsetting
subdf <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

# Plotting
hist(subdf$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Saving to a PNG file
dev.copy (png, file = "plot1.png", height = 480, width = 480)
dev.off()


