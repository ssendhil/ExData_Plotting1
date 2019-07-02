setwd("~/Desktop/Coursera/4_Exploratory_Data_Analysis/Project 1")

plot2_data <- read.table("household_power_consumption.txt", header = T, 
                         sep = ";", na.strings = "?")

# Fix dates
plot2_data$Date <- as.Date(plot2_data$Date, format = "%d/%m/%Y")

# Subset the data
plot2_data_subset <- subset(plot2_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Fix date & time
plot2_data_subset$datetime <- as.POSIXct(paste(as.Date(plot2_data_subset$Date), plot2_data_subset$Time))

# Plot 2
png("plot2.png") 
plot(plot2_data_subset$Global_active_power~plot2_data_subset$datetime,
       type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

