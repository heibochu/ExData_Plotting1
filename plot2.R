# assumes LoadData script (to load data) is in working directory
source('LoadData.R')

# save png device to figure subdirectory
dir.png <- file.path(dir.figure, 'plot2.png')

# open png device for plot2
png(filename=dir.png, width = 480, height = 480)
par(mar=c(5, 5, 1, 1))

# make plot of Time and Global_active_power
plot(pdata.sub$Time, pdata.sub$Global_active_power, 
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

# turn off png device
dev.off()