data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses="character")
data$DT<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data2<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")
data2$Global_active_power<-as.numeric(data2$Global_active_power)
plot(data2$Global_active_power~data2$DT ,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()