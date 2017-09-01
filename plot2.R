#Read Data
Data <- read.table("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors = FALSE)

#Convert dates into "Date" format 
Data$Date <- as.Date(Data$Date,format="%d/%m/%Y")

#subsetting the data with dates "2007-02-01" and "2007-02-02"
Data <- subset(Data, Date >= "2007-02-01" & Date <= "2007-02-02")

#pasting the time with date and converting it into "Time" format
Data$tim<- strptime(paste(Data$Date,Data$Time, sep = " "),format= "%Y-%m-%d %H: %M: %S")

##opening the graphic device
png(filename = "plot2.png",width = 480, height = 480)

#plotting the required plot
plot(Data$tim,Data$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()