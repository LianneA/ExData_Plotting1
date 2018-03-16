##Reading CSV
df<- read.csv("household_power_consumption.txt", header=T, sep=';')

##Filtering data from date 1/2/2007 to 2/2/2007
dfsub <-subset(df, Date %in% c("1/2/2007","2/2/2007"))
df2<-as.numeric(as.character(dfsub$Global_active_power))

##creating plot4
df2<-as.numeric(as.character(dfsub$Global_active_power))
dt <- strptime(paste(dfsub$Date, dfsub$Time), "%d/%m/%Y %H:%M:%S")
dfvolt<-as.numeric(as.character(dfsub$Voltage))
dfreactive<-as.numeric(as.character(dfsub$Global_reactive_power))

par(mfcol=c(2,2))
plot(dt, df2, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot( strptime(paste(dfsub$Date, dfsub$Time), "%d/%m/%Y %H:%M:%S"), submeter1, type="l", xlab="", ylab="Energy sub metering",col="green")
lines(dt, submeter2, type="l",col="red")
lines(dt, submeter3, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("green","red","blue"),cex=0.5)


plot(dt, dfvolt, type="l", xlab="datetime", ylab="Voltage")


plot(dt, dfreactive, type="l", xlab="Datetime", ylab="Global_reactive_power")

##saving plot as plot4.png
dev.copy(png,"plot9.png", width=480, height=480)
dev.off()
