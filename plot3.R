##program to create the Time vs Sub_Metering Line Plot 3 for Assignment 1

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
png(filename="plot3.png")

##create histogram
with(PowerData,plot(Date.Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(PowerData,points(Date.Time,Sub_metering_2,type="l",col="red")) ##add 2nd data set
with(PowerData,points(Date.Time,Sub_metering_3,type="l",col="blue"))  ##add 3rd data set
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","red","blue"))  ##add legend

##close device
dev.off()
