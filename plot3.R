datalink <- "household_power_consumption.txt"
dat1 <- read.table(datalink, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdat <- dat1[dat1$Date %in% c("1/2/2007","2/2/2007") ,]

gap <- as.numeric(subdat$Global_active_power)
date_time <- strptime(paste(subdat$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sm1 <- as.numeric(subdat$Sub_metering_1)
sm2 <- as.numeric(subdat$Sub_metering_2)
sm3 <- as.numeric(subdat$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(date_time, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sm2, type="l", col="red")
lines(date_time, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
