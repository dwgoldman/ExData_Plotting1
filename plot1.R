##program to create the Global Active Power Frequency Histogram for Assignment 1

##read the data from household_power_consumption.txt
##only read the first 100,000 lines which includes all data through 02/002/2007
PowerData<-read.csv("household_power_consumption.txt",nrows=100000,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

##remove rows with no data
PowerData<-PowerData[complete.cases(PowerData),]

##Add Date.Time column to the dataframe
PowerData$Date.Time<-strptime(paste(PowerData[[1]],PowerData[[2]]),"%d/%m/%Y %H:%M:%S")

##subset to only use 2007-02-01 and 2007-02-02 data
PowerData<-PowerData[(PowerData$Date.Time<"2007-02-03")&(PowerData$Date.Time>="2007-02-01"),]

##open PNG file
png(filename="plot1.png")

##create histogram
with(PowerData,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))

##close device
dev.off()
