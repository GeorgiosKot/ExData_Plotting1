##Load Data File
household_power_consumption <- read.csv("C:/Users/user/Desktop/Rep.Data.Analysis/household_power_consumption.txt", header=FALSE, sep=";")
##Format Date + Time
##Subset Data to date ranges provided
##Vars into numeric
sub<- subset(household_power_consumption, household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007")
sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))
sub$Global_reactive_power <- as.numeric(as.character(sub$Global_reactive_power))
sub$Voltage <- as.numeric(as.character(sub$Voltage))
sub$Sub_metering_1 <- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2 <- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3 <- as.numeric(as.character(sub$Sub_metering_3))
sub$Datetime <-paste(sub$Date, sub$Time)

##Output Plot to 480 x 480 png
png("plot3.png", width=480, height=480)
plot(strptime(sub$Datetime, "%d/%m/%Y %H:%M:%S"), sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(sub$Datetime, "%d/%m/%Y %H:%M:%S"), sub$Sub_metering_2, type = "l", col="red")
lines(strptime(sub$Datetime, "%d/%m/%Y %H:%M:%S"), sub$Sub_metering_3, type = "l", col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))