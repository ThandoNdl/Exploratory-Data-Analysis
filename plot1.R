# Read Data
setwd("~/RWork")
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

# Draw necessary plot
GAP <- as.numeric(data$Global_active_power)
png("plot.png", width = 500, height = 500)
hist(GAP, col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()
