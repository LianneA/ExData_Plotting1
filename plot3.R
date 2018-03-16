##Reading CSV
df<- read.csv("household_power_consumption.txt", header=T, sep=';')
##Filtering data from date 1/2/2007 to 2/2/2007
dfsub <-subset(df, Date %in% c("1/2/2007","2/2/2007"))

##creating plot3
dt <- strptime(paste(dfsub$Date, dfsub$Time), "%d/%m/%Y %H:%M:%S")
submeter1<-as.numeric(as.character(dfsub$Sub_metering_1))
submeter2<-as.numeric(as.character(dfsub$Sub_metering_2))
submeter3<-as.numeric(as.character(dfsub$Sub_metering_3))

plot(dt, submeter1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dt, submeter2, type = "l", col = "red" )
lines(dt, submeter3, type = "l", col = "blue" )

legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##saving plot as plot3.png
dev.copy(png,"plot9.png", width=480, height=480)
dev.off()