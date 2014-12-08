data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses="character")
data$DT<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data2<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")
data2$Global_active_power<-as.numeric(data2$Global_active_power)
with(data2, {
  plot(Sub_metering_1~DT ,type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DT,col='Red')
  lines(Sub_metering_3~DT,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.35)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()