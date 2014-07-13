#exp_p1 only contains point for the dates concerned in this exercise. 
#read csv file
x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrows=2880,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#pun into y vector only the interesting values to be represented.
y <- x[["Global_active_power"]]

#Create a vector with the valid dateTime
dateTime <- strptime(paste(x[["Date"]],x[["Time"]],sep=" "),format="%d/%m/%Y %H:%M:%S") 

#Draw the plot
plot(x=dateTime,y=y,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png",width=480,height=480)

#Close the device
dev.off()