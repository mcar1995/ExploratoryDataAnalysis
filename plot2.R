setwd("/Users/mariacecilia/exploratory_data_analysis")

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   colClasses = c(rep("character",2),rep("numeric",7)),
                   na = "?")
dataset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

dataset$DateTime <- paste(dataset$Date, dataset$Time)

dataset$DateTime <- strptime(dataset$DateTime, "%d/%m/%Y %H:%M:%S")

rownames(dataset) <- 1:nrow(dataset)

#PLOT2

png(filename= "plot2.png", width = 480, height= 480, units = "px", bg= "transparent")
plot(dataset$DateTime, dataset$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)")
dev.off()
