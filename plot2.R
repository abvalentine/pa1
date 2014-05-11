# to disable week day titles in local languages
Sys.setlocale("LC_ALL", 'English')

# read and parse data
data <- read.table("household_power_consumption.txt", header=1, sep=";", colClasses=c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot2.png")

# create charts
with(data, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(data, lines(datetime, Global_active_power))

dev.off()
