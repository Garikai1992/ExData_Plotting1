#Clear the working environment
rm(list=ls())
#Set working directory
my_dr <- "C:/Users/Admin2/Desktop/Coursera/Exploratory_Data_Analysis/Week1/ExData_Plotting1"
setwd(my_dr)

#Setup for Downloading the data
filename <- "HH_power.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  d_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(d_url, filename)
}

# Checking if folder exists
if (!file.exists("HH_power_data")) { 
  unzip(filename) 
}

#Read the dataset
raw.data <- read.table("household_power_consumption.txt", sep = ";", 
                       dec = ".", stringsAsFactors= FALSE, na.strings = "?",
                       header = TRUE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric",
                                                   "numeric", "numeric", "numeric"))

# subsetting data for mentioned date
power.data <- raw.data[raw.data$Date %in% c("1/2/2007","2/2/2007"), ]

#Prepare for the plot
datetime <- strptime(paste(power.data$Date, power.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalPower <- as.numeric(power.data$Global_active_power)
voltage <- as.numeric(power.data$Voltage)
submeter1 <- as.numeric(power.data$Sub_metering_1)
submeter2 <- as.numeric(power.data$Sub_metering_2)
submeter3 <- as.numeric(power.data$Sub_metering_3)
globalRect<-as.numeric(power.data$Global_reactive_power)


png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(datetime, globalPower, type="l", ylab="Global Active power", xlab="")

plot(datetime, voltage, type="l", ylab="Voltage", xlab="")

plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalRect, type="l", ylab="global_reactive_power", xlab="datetime")

dev.off()

