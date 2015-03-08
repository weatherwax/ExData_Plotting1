power_consumption<-read.table("household_power_consumption.txt", 
                              sep=";", header=T, 
                              stringsAsFactors=F, 
                              na.strings="?")
power_consumption_sub<- subset(power_consumption,Date=="1/2/2007"| Date=="2/2/2007")

power_consumption_sub$Date<-
strptime(paste(power_consumption_sub$Date,power_consumption_sub$Time),"%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", bg = "transparent", width = 480, height = 480)

with(power_consumption_sub,plot(Date, Global_active_power,
     main="Global Active Power",
     ylab="Global Active Power (kilowatts)",type="l",xlab=""),
     )

dev.off()
