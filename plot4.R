household_power_consumption <- read.csv("C:/Users/user/Desktop/Rep.Data.Analysis/household_power_consumption.txt", header=FALSE, sep=";")
sub<- subset(household_power_consumption, household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007")
##Load Data File
sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))
##Format Date + Time
##Subset Data to date ranges provided
##Vars into numeric
sub$Global_reactive_power <- as.numeric(as.character(sub$Global_reactive_power))
sub$Voltage <- as.numeric(as.character(sub$Voltage))
sub$Sub_metering_1 <- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2 <- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3 <- as.numeric(as.character(sub$Sub_metering_3))
sub$Datetime <-paste(sub$Date, sub$Time)

##Output Plot to 480 x 480 png
png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))
plot(strptime(sub$Datetime, "%d/%m/%Y %H:%M:%S"), sub$Global_active_power, type="l", xlab="",ylab="Global Active Power(Kilowatts)" )
plot(strptime(sub$Datetime, "%d/%m/%Y %H:%M:%S"), sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(sub$Datetime, "%d/%m/%Y %H:%M:%S"), sub$Sub_metering_2, type = "l", col="red")
lines(strptime(sub$Datetime, "%d/%m/%Y %H:%M:%S"), sub$Sub_metering_3, type = "l", col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(strptime(sub$Datetime, "%d/%m/%Y %H:%M:%S"), sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(strptime(sub$Datetime, "%d/%m/%Y %H:%M:%S"), sub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
