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
#####plot 1
hist(subset$Global_active_power, xlab = "Glabal Active Power (kilowatts)", col = "red",
     main= "Global Active Power")
dev.copy(png, file="plot1.png",width = 480, height = 480)
dev.off()

