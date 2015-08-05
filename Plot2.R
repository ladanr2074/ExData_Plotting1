Rdata <- read.csv("household_power_consumption.txt",
                  sep=";",
                  dec=".",
                  na.strings = "?",
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data <- Rdata[(Rdata$Date == "1/2/2007" | Rdata$Date == "2/2/2007"), ]

datetime<- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
globalAp<- as.numeric(data$Global_active_power)

png("plot2.png",width = 480, height = 480)

plot(datetime, globalAp, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.off()


