#read csv file
x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrows=2880,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#pun into y vector only the interesting values to be represented.
y <- x[["Global_active_power"]]

#Create the graph
hist(y,plot=TRUE,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#Copy the graph to the png device
dev.copy(png,file="plot1.png",width=480,height=480)

#Close the device
dev.off()
