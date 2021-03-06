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
power <- as.numeric(subSetData$Global_active_power)

# Print on a png file with dwsired dimensions
png("plot1.png", width=480, height=480)

hist(power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="Red",breaks = 12)

dev.off()