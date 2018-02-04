# plot3.R creates plot3.png

# Checks if the variable already exists, then stores it as a variable
# if not. Also subsets the data accordingly.
if (!exists("housepower")) {
  housepower <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  
  # Changes the Date variable to the Date data type
  housepower$Date <- as.Date(housepower$Date, "%d/%m/%Y")
  
  # Selects only the required subset of dates
  housepower <<- subset(housepower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
}
# Creates another variable column and that stores the date and time combined 
housepower$DateTime <- strptime(paste(housepower$Date, housepower$Time), "%Y-%m-%d %H:%M:%S")

# Opens png device with default 480x480 size
png("plot3.png")

# Draws the 1st scatterplot and labels
plot(housepower$DateTime, housepower$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")

# Draws the 2nd and 3rd overlaid lines
lines(housepower$DateTime, housepower$Sub_metering_2, type = "l", col = "red")
lines(housepower$DateTime, housepower$Sub_metering_3, type = "l", col = "blue")

# Adds a legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# Prints out png file
dev.off()