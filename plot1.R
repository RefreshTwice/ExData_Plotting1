# plot1.R creates plot1.png

# Checks if the variable already exists, then stores it as a variable
# if not. Also subsets the data accordingly.
if (!exists("housepower")) {
  housepower <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  
  # Changes the Date variable to the Date data type
  housepower$Date <- as.Date(housepower$Date, "%d/%m/%Y")
  
  # Selects only the required subset of dates
  housepower <<- subset(housepower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
}
# Opens png device with default 480x480 size
png("plot1.png")

# Draws the histogram and labels
hist(housepower$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Prints out png file
dev.off()