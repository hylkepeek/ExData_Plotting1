#Coursera course Exploratory Data Analysis, programming assignment 1
#This code generates the first plot for the assignment

#The dataset should be in the working directory with the filename 'household_power_consumption.txt
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
library(data.table) 
dt <- data.table(read.table("household_power_consumption.txt", header=TRUE, sep=";"))[Date %in% c("1/2/2007", "2/2/2007")]

#Set column Global_active_power to a numeric value
dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))

#Create graph and save plot in a png-file
png(file="plot1.png",width=480,height=480)
library(datasets)
hist(dt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (killowatts)", ylab="Frequency")
dev.off()