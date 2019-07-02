setwd("~/Desktop/Coursera/4_Exploratory_Data_Analysis/Project 1")

plot4_data <- read.table("household_power_consumption.txt", header = T, 
                         sep = ";", na.strings = "?")

# Fix dates
plot4_data$Date <- as.Date(plot4_data$Date, format = "%d/%m/%Y")

# Subset the data
plot4_data_subset <- subset(plot4_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Fix date & time
plot4_data_subset$datetime <- as.POSIXct(paste(as.Date(plot4_data_subset$Date), plot4_data_subset$Time))

# Plot 4
par(mfrow = c(2, 2))
plot(plot4_data_subset$Global_active_power ~ plot4_data_subset$datetime,
     type = "l", ylab = "Global Active Power", xlab = "")
plot(plot4_data_subset$Voltage ~ plot4_data_subset$datetime, type = "l")
plot(plot4_data_subset$Sub_metering_1 ~ plot4_data_subset$datetime,
     type = "l", ylab = "Energy sub metering", xlab = "")
lines(plot4_data_subset$Sub_metering_2 ~ plot4_data_subset$datetime, col = "Red")
lines(plot4_data_subset$Sub_metering_3 ~ plot4_data_subset$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")
plot(plot4_data_subset$Global_reactive_power ~ plot4_data_subset$datetime, type = "l")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
