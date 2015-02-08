##program to create the Time vs Global Active Power Plot 2 for Assignment 1

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
png(filename="plot2.png")

##create histogram
with(PowerData,plot(Date.Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

##close device
dev.off()
