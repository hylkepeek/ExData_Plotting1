#Coursera course Exploratory Data Analysis, programming assignment 1
#This code generates the second plot for the assignment

#The dataset should be in the working directory with the filename 'household_power_consumption.txt
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
library(data.table) 
dt <- data.table(read.table("household_power_consumption.txt", header=TRUE, sep=";"))[Date %in% c("1/2/2007", "2/2/2007")]

#Set column Global_active_power to a numeric value and Date column to date value
dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))
dt$Date <- as.Date(dt$Date,'%d/%m/%Y')
#Add datetime column by concatenating date and time
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time), format="%Y-%m-%d %H:%M:%S")

#Create graph and save plot in a png-file
#On the X-axis: do = Thursday, vr = Friday, za = Saturday
png(file="plot2.png",width=480,height=480)
plot(dt$DateTime, dt$Global_active_power, type="n", xlab="", ylab="Global Active Power (killowatts)")
lines(dt$DateTime, dt$Global_active_power)
dev.off()