# assumes LoadData script (to load data) is in working directory
source('LoadData.R')

# save png device to figure subdirectory
dir.png <- file.path(dir.figure, 'plot3.png')

# open png device for plot3
png(filename=dir.png, width = 480, height = 480)
par(mar=c(5, 5, 1, 1))

# make empty plot using Time and Sub_metering_1
plot(pdata.sub$Time, pdata.sub$Sub_metering_1, type="n", lwd=1, 
     xlab="", ylab="Energy sub metering")

# fill in lines for metering variables
lines(pdata.sub$Time, pdata.sub$Sub_metering_1, col="black")
lines(pdata.sub$Time, pdata.sub$Sub_metering_2, col="red")
lines(pdata.sub$Time, pdata.sub$Sub_metering_3, col="blue")

# fill in legend for lines
legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

# turn off png device
dev.off()