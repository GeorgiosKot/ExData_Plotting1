##Load Data File
household_power_consumption <- read.csv("C:/Users/user/Desktop/Rep.Data.Analysis/household_power_consumption.txt", header=FALSE, sep=";")
##Format Date + Time
##Subset Data to date ranges provided
##Vars into numeric
sub<- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))
sub$Global_reactive_power <- as.numeric(as.character(sub$Global_reactive_power))
sub$Voltage <- as.numeric(as.character(sub$Voltage))
sub$Sub_metering_1 <- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2 <- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3 <- as.numeric(as.character(sub$Sub_metering_3))
sub$Datetime <-paste(sub$Date, sub$Time)

##Output Plot to 480 x 480 png
png("plot1.png", width=480, height=480)
hist(sub$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()


