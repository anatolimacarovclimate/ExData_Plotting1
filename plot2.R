data <- read.table("household_power_consumption.txt",skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879, sep=";", header = TRUE)
colNam <- read.csv("household_power_consumption.txt", nrows = 1, sep=";")
names(data) <- colnames(colNam)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

plot(data$DateTime,data$Global_active_power, ylab = "Global Active Power (killowats)", xlab="", type = "l")

dev.print(png, file="plot2.png", width=480, height=480, units = "px")
dev.off()