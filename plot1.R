##Reading CSV
df<- read.csv("household_power_consumption.txt", header=T, sep=';',na.strings="?")

##Filtering data from date 1/2/2007 to 2/2/2007
dfsub <-subset(df, Date %in% c("1/2/2007","2/2/2007"))
df2<-as.numeric(as.character(dfsub$Global_active_power))

##Creating plot1
hist(df2, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Saving plot as plot1.png 
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
