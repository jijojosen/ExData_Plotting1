#Read Data
Data <- read.table("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors = FALSE)

#Convert dates into "Date" format 
Data$Date <- as.Date(Data$Date,format="%d/%m/%Y")

#subsetting the data with dates "2007-02-01" and "2007-02-02"
Data <- subset(Data, Date >= "2007-02-01" & Date <= "2007-02-02")

#pasting the time with date and converting it into "Time" format
time <- strptime(paste(Data$Date,Data$Time,sep = " "),format="%Y-%m-%d %H:%M:%S")

##opening the graphic device
png(filename = "plot3.png",width = 480,height = 480)

#plotting the required plot
plot(time,Data$Sub_metering_1,type = "l",col="black", xlab = "", ylab = "Energy sub metering")
lines(time,Data$Sub_metering_2,type = "l",col="red")
lines(time,Data$Sub_metering_3,type = "l",col="blue")

#adding legends
legend("topright",lty=1,legend = (c("Sub_metering_1","Sub_metering_2","Sub_metering_3")),col=c("red","blue","green"))
dev.off()