# Read Data
setwd("~/RWork")
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

# Draw necessary plot
View(data)

timepart <- strptime(paste(data$Date, data$Time, sep =" "), "%d/%m/%Y %H:%M:%S")

GAP <- as.numeric(data$Global_active_power)
GRP <- as.numeric(data$Global_reactive_power)
vLT <- as.numeric(data$Voltage)

sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)

png("plot4.png", width = 500, height = 500)
par(mfrow = c(2,2))

plot(timepart, GAP, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(timepart, VLT, type = "l", xlab = "datetime", ylab = "Voltage")

plot(timepart, sm1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(timepart, sm2, type = "l", col = "red")
lines(timepart, sm3, type = "l", col = "blue")

legend("topright", c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"), lty =, lwd=2.5, col = c("black", "red", "blue"))

plot(timepart, GRP, type = "l", xlab = "datetime", ylab = "Global Reactive Power", cex = 0.2)

dev.off()
