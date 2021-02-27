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
activepower <- as.numeric(power.data$Global_active_power)

#Plot the chart
png("plot2.png", width=480, height=480)
plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()









