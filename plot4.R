# to disable week day titles in local languages
Sys.setlocale("LC_ALL", 'English')

# read and parse data
data <- read.table("household_power_consumption.txt", header=1, sep=";", colClasses=c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot4.png")

# create charts
par(mfrow = c(2, 2))

with(data, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(data, lines(datetime, Global_active_power))

with(data, plot(datetime, Voltage, type="n", xlab="datetime"))
with(data, lines(datetime, Voltage))

with(data, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy Sub Metering"))
with(data, lines(datetime, Sub_metering_1, col="gray"))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=1, bty="n", col=c("gray", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(datetime, Global_reactive_power, type="n", xlab="datetime"))
with(data, lines(datetime, Global_reactive_power))

dev.off()
