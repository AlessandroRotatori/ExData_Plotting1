library(data.table)
setwd("/Users/Alessandro/Documents/DataScience/4. Exploratory Data Analysis/Assignment 1/")
DPCt <- read.table(file = "household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", stringsAsFactors=FALSE, colClasses = c(rep("character", 2), rep("numeric", 7)))
DPCt$Date <- as.Date(DPCt$Date, format = "%d/%m/%Y")
DPC <- DPCt[DPCt$Date=="2007-02-01" | DPCt$Date=="2007-02-02", ]
DPC$DateTime <- strptime(x = paste(as.character(DPC$Date), DPC$Time), format = "%Y-%m-%d %H:%M:%S")
rm(DPCt)
#png(...) and dev.off() required to export in .png format the plot.
#If an export of the image is not required, please put an "#" in respective rows

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2))

#Plotting graph in top/left quadrant
with(data = DPC, expr = plot(x = DPC$DateTime, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#Plotting graph bottom/left quadrant
with(data = DPC, expr = plot(x = DateTime, y = Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"), col="blac")
with(data = DPC, lines(x = DateTime, y = Sub_metering_2, col="red"))
with(data = DPC, lines(x = DateTime, y = Sub_metering_3, col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

#Plotting graph top/right
with(data = DPC, expr = plot(x = DateTime, y = Voltage, xlab = "datetime", ylab = "Voltage", type="l", lty=1))

#Plotting graph bottom/right
with(data = DPC, expr = plot(x = DateTime, y = Global_reactive_power, type="l", lty=1, xlab="datetime"))
dev.off()