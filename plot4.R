rm(list = ls())

# --------------------------------------------------------
# Download of file commented to avoid to do it every time
# --------------------------------------------------------

#url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url, 
#              destfile='electricity.zip',
#              method="auto", # for OSX / Linux 
#              mode="wb") # "wb" means "write binary," and is used for binary files

#unzip(zipfile = "electricity.zip") # unpack the files into subdirectories 

# Read data
print("Reading data.....")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Select relevant onservations
print("Reading finished")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]




date  <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_meter1 <- as.numeric(subSetData$Sub_metering_1)
sub_meter2 <- as.numeric(subSetData$Sub_metering_2)
sub_meter3 <- as.numeric(subSetData$Sub_metering_3)
power      <- as.numeric(subSetData$Global_active_power)
voltage    <- as.numeric(subSetData$Voltage)
reactive_power <- as.numeric(subSetData$Global_reactive_power)



# Print on a png file with dwsired dimensions
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2),mar=c(4,4,3,3))

plot(date,power, ylab="Global Active Power (kilowatts)", type="l", xlab="")
plot(date,voltage, ylab="Voltage", type="l", xlab="datetime")

plot(date,sub_meter1, ylab="Energy sub-metering", type="l", xlab="")
points(date,sub_meter2, type="l", col="red")
points(date,sub_meter3, type="l", col="blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("blue","red","green"),lty=1, lwd=2)
par(lwd = 0.5)
plot(date,reactive_power, ylab="Global_reactive_power", type="l", xlab="datetime")


dev.off()