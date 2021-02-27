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


#Change the date from factor to date
library(lubridate)
raw.data$Date<-dmy(raw.data$Date)

#Subset the dates to be used
power.data<-subset(raw.data, Date>="2007-02-01" & Date<="2007-02-02")

#Remove raw.data in the global environment'
rm(raw.data)

png("plot1.png", width=480, height=480)
hist(power.data$Global_active_power, col = "red", 
             main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)")
dev.off()


