datalink <- "household_power_consumption.txt"
dat1 <- read.table(datalink, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdat <- dat1[dat1$Date %in% c("1/2/2007","2/2/2007") ,]

gap <- as.numeric(subdat$Global_active_power)
date_time <- strptime(paste(subdat$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sm1 <- as.numeric(subdat$Sub_metering_1)
sm2 <- as.numeric(subdat$Sub_metering_2)
sm3 <- as.numeric(subdat$Sub_metering_3)
grp <- as.numeric(subdat$Global_reactive_power)
vol <- as.numeric(subdat$Voltage)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, vol, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sm2, type="l", col="red")
lines(date_time, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
