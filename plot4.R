Rdata <- read.csv("household_power_consumption.txt",
                  sep=";",
                  dec=".",
                  na.strings = "?",
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data <- Rdata[(Rdata$Date == "1/2/2007" | Rdata$Date == "2/2/2007"), ]

datetime<- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

globalAp<- as.numeric(data$Global_active_power)
globalRp<- as.numeric(data$Global_reactive_power)
voltage<- as.numeric(data$Voltage)

subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(datetime, globalAp, type = "l", xlab = "", ylab = "Global Active Power", cex=0.2)

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1.7, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalRp, type = "l", xlab = "datetime", ylab = "Global_Active_Power")

dev.off()



