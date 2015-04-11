library(data.table)
setwd("/Users/Alessandro/Documents/DataScience/4. Exploratory Data Analysis/Assignment 1/")
DPCt <- read.table(file = "household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", stringsAsFactors=FALSE, colClasses = c(rep("character", 2), rep("numeric", 7)))
DPCt$Date <- as.Date(DPCt$Date, format = "%d/%m/%Y")
DPC <- DPCt[DPCt$Date=="2007-02-01" | DPCt$Date=="2007-02-02", ]
DPC$DateTime <- strptime(x = paste(as.character(DPC$Date), DPC$Time), format = "%Y-%m-%d %H:%M:%S")
rm(DPCt)

#png(...) and dev.off() required to export in .png format the plot.
#If an export of the image is not required, please put an "#" in respective rows

png(filename = "plot2.png", width = 480, height = 480)
with(data = DPC, expr = plot(x = DPC$DateTime, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()