Rdata <- read.csv("household_power_consumption.txt",
                  sep=";",
                  dec=".",
                  na.strings = "?",
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data <- Rdata[(Rdata$Date == "1/2/2007" | Rdata$Date == "2/2/2007"), ]

datetime<- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width =480, height = 480 )

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering1, type="l", col="black")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.7, col = c("black","red","blue"))

dev.off()
