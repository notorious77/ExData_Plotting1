ElecPwrConsum <- read.table("household_power_consumption.txt", encoding="UTF-8", sep = ";", header = TRUE, na.strings = "?")

newdate <- as.Date(ElecPwrConsum$Date, format = "%d/%m/%Y")
##strptime(ElecPwrConsum$Date, format = "%d/%m/%Y")
newdata <- cbind(ElecPwrConsum,newdate )
newdata1 <- subset(newdata, select = c(10,1:9) )
relevantdata <- subset (newdata1, newdate =='2007-02-01')
relevantdat2 <- subset (newdata1, newdate =='2007-02-02')
alldata <- rbind(relevantdata, relevantdat2)

alldata$datetime <- strptime(paste(alldata$Date, alldata$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

par(mfrow = c(2,2))
#upperleft
plot(alldata$datetime, alldata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#upperright
plot(alldata$datetime, alldata$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#lowerleft
plot(alldata$datetime, alldata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")

points(alldata$datetime, alldata$Sub_metering_2, type = "l", xlab = "", ylab = "Energy Sub Metering", col ="red")
points(alldata$datetime, alldata$Sub_metering_3, type = "l", xlab = "", ylab = "Energy Sub Metering", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))
#lowerright
plot(alldata$datetime, alldata$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.off()