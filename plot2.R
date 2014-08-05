setwd("C:/backup/backup/coursera/exploratory data analysis/assignment 1")
data <- read.table(unz( "exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),sep = ";", header = TRUE)

#converting factor variable to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#datetime variable represents datetime . Paste function concatenates date and time, strptime function converts into POSIXct format
data$datetime <- as.POSIXct(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"))

#sub setting only feb 1 and feb 2 data
dataset <- data[data$datetime >= "2007-02-01 00:00:00" & data$datetime < "2007-02-03 00:00:00", ]

png(file = "plot2.png",width = 480, height = 480, units = "px")
plot(  dataset$datetime ,dataset$Global_active_power, xlab = "", ylab = "Global Active Power(Kilowatts)",type = "l" )
dev.off()

