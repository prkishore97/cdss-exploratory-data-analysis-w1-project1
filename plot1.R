datalink <- "household_power_consumption.txt"
dat1 <- read.table(datalink, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdat <- dat1[dat1$Date %in% c("1/2/2007","2/2/2007") ,]

gap <- as.numeric(subdat$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
