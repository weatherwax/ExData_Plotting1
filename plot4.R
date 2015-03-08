power_consumption<-read.table("household_power_consumption.txt", 
                              sep=";", header=T, 
                              stringsAsFactors=F, 
                              na.strings="?")

power_consumption_sub<- subset(power_consumption,Date=="1/2/2007"| Date=="2/2/2007")

power_consumption_sub$Date<-
  strptime(paste(power_consumption_sub$Date,power_consumption_sub$Time),"%d/%m/%Y %H:%M:%S")


    
png(file = "plot4.png", bg = "transparent", width = 480, height = 480)

par(mfrow = c(2,2))

with(power_consumption_sub,plot(Date, Global_active_power,
                                ylab="Global Active Power",type="l",xlab=""),
)

with(power_consumption_sub,plot(Date, Voltage,
                                ylab="Voltage",type="l",xlab="datetime"),
)

with(power_consumption_sub,plot(Date, Sub_metering_1,
                                ylab="Energy sub metering",type="l",
                                xlab="",lty = 1),
)
with(power_consumption_sub, lines(Date, Sub_metering_2, col =
            "red"
))
with(power_consumption_sub, lines(Date, Sub_metering_3, col =
                                    "blue"
))
legend(
  "topright", lty = c(1,1,1), col = c("black","red","blue"), 
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(power_consumption_sub,plot(Date, Global_reactive_power,
                                ylab="Global_reactive_power",type="l",
                                xlab="datetime"),
)

dev.off()
