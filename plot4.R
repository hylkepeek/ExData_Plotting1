#Coursera course Exploratory Data Analysis, programming assignment 1
#This code generates the fourth plot for the assignment

#The dataset should be in the working directory with the filename 'household_power_consumption.txt
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
library(data.table) 
dt <- data.table(read.table("household_power_consumption.txt", header=TRUE, sep=";"))[Date %in% c("1/2/2007", "2/2/2007")]

#Set value columns to a numeric value and Date column to date value
dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))
dt$Global_reactive_power <- as.numeric(as.character(dt$Global_reactive_power))
dt$Voltage <- as.numeric(as.character(dt$Voltage))
dt$Sub_metering_1 <- as.numeric(as.character(dt$Sub_metering_1))
dt$Sub_metering_2 <- as.numeric(as.character(dt$Sub_metering_2))
dt$Sub_metering_3 <- as.numeric(as.character(dt$Sub_metering_3))
dt$Date <- as.Date(dt$Date,'%d/%m/%Y')
#Add datetime column by concatenating date and time
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time), format="%Y-%m-%d %H:%M:%S")

#Create graph and save plot in a png-file
#On the X-axis: do = Thursday, vr = Friday, za = Saturday
png(file="plot4.png",width=480,height=480)
#Set ouput view to 2 rows and 2 columns
par(mfcol=c(2,2))
par(mar = c(5.1, 4.1, 2.1, 2.1))
#Add first plot
plot(dt$DateTime, dt$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(dt$DateTime, dt$Global_active_power)
#Add second plot
plot(dt$DateTime, dt$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
lines(dt$DateTime, dt$Sub_metering_1, col="black")
lines(dt$DateTime, dt$Sub_metering_2, col="red")
lines(dt$DateTime, dt$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")
#Add third plot
plot(dt$DateTime, dt$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(dt$DateTime, dt$Voltage)
#Add fourth plot
plot(dt$DateTime, dt$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(dt$DateTime, dt$Global_reactive_power)

dev.off()