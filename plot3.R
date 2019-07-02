setwd("~/Desktop/Coursera/4_Exploratory_Data_Analysis/Project 1")

plot3_data <- read.table("household_power_consumption.txt", header = T, 
                         sep = ";", na.strings = "?")

# Fix dates
plot3_data$Date <- as.Date(plot3_data$Date, format = "%d/%m/%Y")

# Subset the data
plot3_data_subset <- subset(plot3_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Fix date & time
plot3_data_subset$datetime <- as.POSIXct(paste(as.Date(plot3_data_subset$Date), plot3_data_subset$Time))

#Plot 3
plot(plot3_data_subset$Sub_metering_1 ~ plot3_data_subset$datetime,
     type = "l", ylab = "Energy sub metering", xlab = "")
lines(plot3_data_subset$Sub_metering_2 ~ plot3_data_subset$datetime, col = "Red")
lines(plot3_data_subset$Sub_metering_3 ~ plot3_data_subset$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
