##Reading CSV
df<- read.csv("household_power_consumption.txt", header=T, sep=';')

##Filtering data from date 1/2/2007 to 2/2/2007
dfsub <-subset(df, Date %in% c("1/2/2007","2/2/2007"))
df2<-as.numeric(as.character(dfsub$Global_active_power))

##creating plot2
dt <- strptime(paste(dfsub$Date, dfsub$Time), "%d/%m/%Y %H:%M:%S")
plot(dt, df2, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##saving plot as plot2.png
dev.copy(png,"plot9.png", width=480, height=480)
dev.off()