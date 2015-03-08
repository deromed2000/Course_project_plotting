######### Course Project
### loading dataset

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileURL,temp, mode = "wb")
con <- unzip(temp, "household_power_consumption.txt")
powerElecData <- read.table(con, na.string = "?", header = TRUE, 
                            sep = ";")
unlink(temp)

subset <- powerElecData[powerElecData$Date == "1/2/2007" | powerElecData$Date == "2/2/2007",]
#####plot 4
par(mfcol = c(2,2), mar = c(4,4,4,1), oma = c(1,0,0,0))
with(subset, {
  plot(datetime2, subset$Global_active_power, type = "l", xlab = "",
       ylab = "Glabal Active Power")
  plot(datetime2, subset$Sub_metering_1, type = "n", xlab = "", ylab="Energy Sub metering")
  lines(datetime2, subset$Sub_metering_1, col = "black")
  lines(datetime2, subset$Sub_metering_2, col = "red")
  lines(datetime2, subset$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col = c("black", "red", "blue"),lwd = 1, lty = 1, merge = FALSE)
  plot(datetime2, subset$Voltage, type = "l", xlab = "datetime",
       ylab = "Voltage")
  plot(datetime2, subset$Global_reactive_power, type = "l", xlab = "datetime",
       ylab = "Glabal_reactive_Power")
})
dev.copy(png, file="plot4.png",width = 480, height = 480)
dev.off()
