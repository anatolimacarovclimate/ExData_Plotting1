data <- read.table("household_power_consumption.txt",skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879, sep=";", header = TRUE)
colNam <- read.csv("household_power_consumption.txt", nrows = 1, sep=";")
names(data) <- colnames(colNam)

hist(data$Global_active_power, xlab = "Global Active Power (killowats)", col = "red", main = "Global Active Power")

dev.print(png, file="plot1.png", width=480, height=480, units = "px")
dev.off()