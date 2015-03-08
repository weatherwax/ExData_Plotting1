power_consumption<-read.table("household_power_consumption.txt", 
                              sep=";", header=T, 
                              stringsAsFactors=F, 
                              na.strings="?")

power_consumption_sub<- subset(power_consumption,Date=="1/2/2007"| Date=="2/2/2007")


png(file = "plot1.png", bg = "transparent", width = 480, height = 480)
hist(power_consumption_sub$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red",
     yaxt = "n")
at <- seq(from = 0, 
          to = 1200, 
          by = 200)

axis(side = 2, at = at)
dev.off()
