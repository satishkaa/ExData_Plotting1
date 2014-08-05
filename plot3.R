setwd("C:/backup/backup/coursera/exploratory data analysis/assignment 1")
data <- read.table(unz( "exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),sep = ";", header = TRUE)

#converting factor variable to numeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#datetime variable represents datetime . Paste function concatenates date and time, strptime function converts into POSIXct format
data$datetime <- as.POSIXct(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"))

#sub setting only feb 1 and feb 2 data
dataset <- data[data$datetime >= "2007-02-01 00:00:00" & data$datetime < "2007-02-03 00:00:00", ]

png(file = "plot3.png",width = 480, height = 480, units = "px")
plot(  dataset$datetime ,dataset$Sub_metering_1 ,  type = "l" , xlab = "",  ylab = "Energy sub meterring" )
lines( dataset$datetime , dataset$Sub_metering_2 ,col = "red", type = "l" )
lines( dataset$datetime , dataset$Sub_metering_3 ,col = "blue", type = "l" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), col = c("black","red","blue"))
dev.off()

