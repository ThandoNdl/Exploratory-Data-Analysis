# Read Data
setwd("~/RWork")
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

# Draw necessary plot
View(data)
timepart <- strptime(paste(data$Date, data$Time, sep =" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(data$Global_active_power)
png("plot2.png", width = 500, height = 500)
plot(timepart, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
