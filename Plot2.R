library("data.table")

##Read in data file and select data for specified dates
HouseholdPower <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
House_A <- rbind(HouseholdPower[HouseholdPower$Date=="1/2/2007",], HouseholdPower[HouseholdPower$Date=="2/2/2007",])

##Transform Date to date format and create a new variable joining time & date
House_A$Date <- as.Date(House_A$Date, format ="%d/%m/%Y")
House_A$Time <- format(House_A$Time, format="%H:%M:%S")
House_A <- cbind(House_A, "DateTime" = as.POSIXct(paste(House_A$Date, House_A$Time)))

##Plot 2
plot(House_A$Global_active_power~House_A$DateTime, type="l", xlab="Day", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png", height=480, width=480)
dev.off

