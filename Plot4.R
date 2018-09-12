#Extract file and select data from data range
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
house_a_data <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

#Transform date to correct formate and create new variable with date & time combined
house_a_data$Date <- as.Date(house_a_data$Date,"%d/%m/%Y")
house_a_data<-cbind(house_a_data, "DateTime" = as.POSIXct(paste(house_a_data$Date, house_a_data$Time)))

#PLot 1
par(mfrow=c(2,2))
plot(house_a_data$Global_active_power ~ house_a_data$DateTime, type="l", xlab="Day/Time", ylab = "Global Active Power (kilowatts)")

#Plot2
plot(house_a_data$Voltage ~ house_a_data$DateTime, type="l", xlab="Day/Time", ylab = "Voltage")

#PLot3
with(house_a_data, {plot(Sub_metering_1 ~ DateTime, type="l", xlab="Day/Time", ylab = "Energy Sub Metering")})
lines(house_a_data$Sub_metering_2 ~ house_a_data$DateTime, col = 'Red')
lines(house_a_data$Sub_metering_3 ~ house_a_data$DateTime, col = 'Blue')

#Plot4
plot(house_a_data$Global_reactive_power ~ house_a_data$DateTime, type="l", xlab="Day/Time", ylab = "Global Reactive Power")