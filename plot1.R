library(data.table)
#Insert between "" the working directory
#setwd("")
DPCt <- read.table(file = "household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", stringsAsFactors=FALSE, colClasses = c(rep("character", 2), rep("numeric", 7)))
DPCt$Date <- as.Date(DPCt$Date, format = "%d/%m/%Y")
DPC <- DPCt[DPCt$Date=="2007-02-01" | DPCt$Date=="2007-02-02", ]
rm(DPCt)

#png(...) and dev.off() required to export in .png format the plot.
#If an export of the image is not required, please put an "#" in respective rows

png(filename = "plot1.png", width = 480, height = 480)
hist(x = DPC$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
