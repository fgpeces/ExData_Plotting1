#read csv file
x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrows=2880,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Create the layout for this exercise 2x2
par(mfrow=c(2,2))
par(mar=c(4,4.1,4.1,2.1))

#Create a vector with the valid dateTime
dateTime <- strptime(paste(x[["Date"]],x[["Time"]],sep=" "),format="%d/%m/%Y %H:%M:%S") 

#Plot placed in 1,1
y <- x[["Global_active_power"]]
plot(x=dateTime,y=y,type="l",ylab="Global Active Power",xlab="",cex.lab=0.90,cex.axis=0.90)

#Plot placed in 1,2
plot(x=dateTime,y=x[["Voltage"]],type="l",ylab="Voltage",xlab="datetime",cex.lab=0.90,cex.axis=0.90)

#Plot placed in 2,1
plot(dateTime,x[["Sub_metering_1"]],ylab="Energy sub metering",xlab="",type="l",cex.lab=0.90,cex.axis=0.90)
points(dateTime,x[["Sub_metering_2"]],col="red",type="l")
points(dateTime,x[["Sub_metering_3"]],col="blue",type="l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n",cex=0.85)

#Plot placed in 2,2
plot(x=dateTime,y=x[["Global_reactive_power"]],type="l",ylab="Global_reactive_power",xlab="datetime",cex.lab=0.90,cex.axis=0.90)


#Copy to a PNG file
dev.copy(png,file="plot4.png",width=480,height=480)

#Close the device
dev.off()

