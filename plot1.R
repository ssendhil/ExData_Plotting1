setwd("~/Desktop/Coursera/4_Exploratory_Data_Analysis/Project 1")

plot1_data <- read.table("household_power_consumption.txt", header = T, 
                         sep = ";", na.strings = "?")

# Subset the data
plot1_data_subset <- subset(plot1_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plot 1
hist(plot1_data_subset$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
