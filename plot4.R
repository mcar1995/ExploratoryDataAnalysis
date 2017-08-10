
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   colClasses = c(rep("character",2),rep("numeric",7)),
                   na = "?")
dataset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

dataset$DateTime <- paste(dataset$Date, dataset$Time)

dataset$DateTime <- strptime(dataset$DateTime, "%d/%m/%Y %H:%M:%S")

rownames(dataset) <- 1:nrow(dataset)

#PLOT4

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg= "transparent")
par(mfrow= c(2,2))

# top left 
plot(dataset$DateTime, dataset$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power")

#top right
plot(dataset$DateTime, dataset$Voltage, type= "l", xlab= "datetime", ylab = "Voltage")

#bottom left
plot(dataset$DateTime, dataset$Sub_metering_1, type = "l", col= "black", xlab = "", 
     ylab = "Energy sub metering", ylim= c(0,40))
lines(dataset$DateTime, dataset$Sub_metering_2, col= "red")
lines(dataset$DateTime, dataset$Sub_metering_3, col= "blue")

legend("topright", col= c("black", "red", "blue"), lwd = 1, 
       legend = c("sub_metering 1", "sub_metering 2", "sub_metering_3"))

#bottom right
plot(dataset$DateTime, dataset$Global_reactive_power, type = "l", col= "black", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
