# loads household power data

# get current directory. Assume that data and figure folders are subdirectories of current directory.
dir.curr <- getwd()
dir.data <- file.path(dir.curr, 'data')
dir.figure <- file.path(dir.curr, 'figure')

# text data file, assumed to be in data folder
datafile <- file.path(dir.data, 'household_power_consumption.txt')

# searchs for existence of txt data file in data subdirectory.  if none is found, will download zip from URL
if (!file.exists(datafile)) {
  # create data and figure folders, ignore errors if they already exist
  dir.create(dir.data, showWarnings = FALSE)
  dir.create(dir.figure, showWarnings = FALSE)
  
  fileURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  zipfile <- file.path(dir.data, basename(fileURL))
  
  # download zip file to data folder and unzip text file in data folder
  download.file(fileURL, destfile = zipfile)
  unzip(zipfile, exdir = dir.data)
  
}

# standardizing data from text file into data frame
pdata <- read.table(datafile, header = TRUE, sep = ';', na.string = '?', 
                    colClass = c('character','character', rep('numeric', 7)))

# convert Date variable from character to Date
pdata$Date <- as.Date(pdata$Date, '%d/%m/%Y')

# limit data frame to Feb 01, 2007 to Feb 02, 2007
pdata.sub <- pdata[pdata$Date >= as.Date('2007/02/01') & pdata$Date <= as.Date('2007/02/02'),]

# convert Time variable from character to POSIX
pdata.sub$Time <- paste(pdata.sub$Date, pdata.sub$Time, sep=" ")
pdata.sub$Time <- as.POSIXlt(pdata.sub$Time)