data <- read.table("household_power_consumption.txt",skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879, sep=";", header = TRUE)
colNam <- read.csv("household_power_consumption.txt", nrows = 1, sep=";")
names(data) <- colnames(colNam)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
par(mfcol = c(2,2))
plot(data$DateTime,data$Global_active_power, ylab = "Global Active Power", xlab="", type = "l")

plot(data$DateTime,data$Sub_metering_1, ylab = "Energy Sub Metering", xlab="", type = "l")
points(data$DateTime, data$Sub_metering_2, col = "red", type = "l")
points(data$DateTime, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), cex=0.7, box.lwd = 0)

plot(data$DateTime,data$Voltage, ylab = "Voltage", xlab="datetime", type = "l")

plot(data$DateTime,data$Global_reactive_power, ylab = "Global_reactive_power", xlab="datetime", type = "l")

dev.print(png, file="plot4.png", width=480, height=480, units = "px")
dev.off()