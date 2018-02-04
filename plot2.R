# plot2.R creates plot2.png

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
png("plot2.png")

# Draws the scatterplot and labels
plot(housepower$DateTime, housepower$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")

# Prints out png file
dev.off()