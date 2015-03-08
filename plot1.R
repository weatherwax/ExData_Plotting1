#Read the data (the file must be in the working directory)
power_consumption<-read.table("household_power_consumption.txt", 
                              sep=";", header=T, 
                              stringsAsFactors=F, 
                              na.strings="?")

#Get data from 2007-02-01 to 2007-02-02
power_consumption_sub<-subset(power_consumption,Date=="1/2/2007"| Date=="2/2/2007")

#Open 480x480 transparent png file in "figure" folder
png(file = "figure/plot1.png", bg = "transparent", width = 480, height = 480)

#Create histogram with title and x axis label, but no y axis
hist(power_consumption_sub$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red",
     yaxt = "n")

#Create sequence of ticks for y axis
at <- seq(from = 0, 
          to = 1200, 
          by = 200)

#Create y axis
axis(side = 2, at = at)

#Close png file
dev.off()
