#Read Data
Data <- read.table("household_power_consumption.txt",header = TRUE, sep=";")

#Convert dates into "Date" format 
Data$Date <- as.Date(Data$Date,format="%d/%m/%Y")

#Convert time into "Time" format 
Data$Time <- strptime(Data$Time,format = "%H:%M:%S")

#subsetting the data with dates "2007-02-01" and "2007-02-02" 
Data <- Data[Data$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

#opening the plotting device
png(filename = "plot1.png",width = 480, height = 480)

#plotting the histogram
hist(as.numeric(as.character(Data$Global_active_power)),breaks = 12, main = "Global Active Power",col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
