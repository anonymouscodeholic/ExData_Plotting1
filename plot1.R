filename <- "household_power_consumption.txt"

data <- read.table(file = filename, header = TRUE, sep = ";", na.strings = c("?"),
                  col.names = c("Date", "Time", "Global Active Power (kilowatts)", "Global Reactive Power (kilowatts)", 
                               "Voltage", "Global Intensity",
                               "Sub_metering_1", "Sub_metering_2", "Sub_metering_1"),
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
                  )

data$DateTime = strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- data[data$DateTime >= strptime("2007-02-01", format = '%Y-%m-%d') & data$DateTime < strptime("2007-02-03", format = '%Y-%m-%d'), ]

png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(data[,3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()