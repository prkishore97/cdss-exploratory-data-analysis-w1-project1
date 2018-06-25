datalink <- "household_power_consumption.txt"
dat1 <- read.table(datalink, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdat <- dat1[dat1$Date %in% c("1/2/2007","2/2/2007") ,]

gap <- as.numeric(subdat$Global_active_power)
date_time <- strptime(paste(subdat$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(date_time,gap,type="l",xlab="",ylab="Global Active Power (kilowatts")
dev.off()
