setwd("C:/backup/backup/coursera/exploratory data analysis/assignment 1")
data <- read.table(unz( "exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),sep = ";", header = TRUE)

#converting factor variable to numeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))


#datetime variable represents datetime . Paste function concatenates date and time, strptime function converts into POSIXct format
data$datetime <- as.POSIXct(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"))

#sub setting only feb 1 and feb 2 data
dataset <- data[data$datetime >= "2007-02-01 00:00:00" & data$datetime < "2007-02-03 00:00:00", ]



#opening device
png(file = "plot4.png",width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

#Global active power plot
plot(  dataset$datetime ,dataset$Global_active_power, xlab = "", ylab = "Global Active Power",type = "l" )

#Voltage plot
plot(  dataset$datetime ,dataset$Voltage, xlab = "", ylab = "Voltage",type = "l" )

#Energy sub metering plot
plot(  dataset$datetime ,dataset$Sub_metering_1 ,  type = "l" , xlab = "",  ylab = "Energy sub meterring" )
lines( dataset$datetime , dataset$Sub_metering_2 ,col = "red", type = "l" )
lines( dataset$datetime , dataset$Sub_metering_3 ,col = "blue", type = "l" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), col = c("black","red","blue") , bty = 'n')



#Global reactive power plot
plot(  dataset$datetime ,dataset$Global_reactive_power, xlab = "", ylab = "Global Rective Power",type = "l" )


dev.off()



