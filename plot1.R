

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   colClasses = c(rep("character",2),rep("numeric",7)),
                   na = "?")
dataset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

dataset$DateTime <- paste(dataset$Date, dataset$Time)

dataset$DateTime <- strptime(dataset$DateTime, "%d/%m/%Y %H:%M:%S")

rownames(dataset) <- 1:nrow(dataset)

#PLOT1

png(filename= "plot1.png", width = 480, height = 480, units= "px")
hist(dataset$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     breaks = 12, ylim = c(0, 1200))
dev.off()
