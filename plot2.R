#Read the data (the file must be in the working directory)
power_consumption<-read.table("household_power_consumption.txt", 
                              sep=";", header=T, 
                              stringsAsFactors=F, 
                              na.strings="?")

#Get data from 2007-02-01 to 2007-02-02
power_consumption_sub<- subset(power_consumption,Date=="1/2/2007"| Date=="2/2/2007")

#Convert to datetime the date and time for each row
power_consumption_sub$Date<-
strptime(paste(power_consumption_sub$Date,power_consumption_sub$Time),"%d/%m/%Y %H:%M:%S")

#Open 480x480 transparent png file in "figure" folder
png(file = "figure/plot2.png", bg = "transparent", width = 480, height = 480)

#Create line scatterplot (datetime vs Global_active_power) without title
with(power_consumption_sub,plot(Date, Global_active_power,
     ylab="Global Active Power (kilowatts)",type="l",xlab=""),
     )

#Close png file
dev.off()
