# assumes LoadData script (to load data) is in working directory
source('LoadData.R')

# save png device to figure subdirectory
dir.png <- file.path(dir.figure, 'plot1.png')

# open png device for plot1
png(filename=dir.png, width = 480, height = 480)

# make histogram of Global_active_power
hist(pdata.sub$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# turn off png device
dev.off()