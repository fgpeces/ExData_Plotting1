#read csv file
x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrows=2880,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Create a vector with the valid dateTime to be used for x-axis
dateTime <- strptime(paste(x[["Date"]],x[["Time"]],sep=" "),format="%d/%m/%Y %H:%M:%S") 

#Draw the plot
plot(dateTime,x[["Sub_metering_1"]],ylab="Energy sub metering",xlab="",type="l")
points(dateTime,x[["Sub_metering_2"]],col="red",type="l")
points(dateTime,x[["Sub_metering_3"]],col="blue",type="l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

#Copy to a PNG file
dev.copy(png,file="plot3.png",width=480,height=480)

#Close the device
dev.off()