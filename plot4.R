# assumes LoadData script (to load data) is in working directory
source('LoadData.R')

# save png device to figure subdirectory
dir.png <- file.path(dir.figure, 'plot4.png')

# open png device for plot4
png(filename=dir.png, width = 480, height = 480)

# standardize margins and fill by rows
par(mar=c(5, 5, 1, 1), mfrow=c(2,2))

# plot for Time vs. Global_active_power (plot2)
plot(pdata.sub$Time, pdata.sub$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

# plot for Time vs. Voltage
plot(pdata.sub$Time, pdata.sub$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# plot for Time vs. metering variables (plot3)
plot(pdata.sub$Time, pdata.sub$Sub_metering_1, type="n", lwd=1,
     xlab="", ylab="Energy sub metering")

lines(pdata.sub$Time, pdata.sub$Sub_metering_1, col="black")
lines(pdata.sub$Time, pdata.sub$Sub_metering_2, col="red")
lines(pdata.sub$Time, pdata.sub$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       box.lwd=0)

# plot for Time vs. Global_reactive_power
plot(pdata.sub$Time, pdata.sub$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global Reactive Power")

# turn off png device
dev.off()