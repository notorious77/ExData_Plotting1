ElecPwrConsum <- read.table("household_power_consumption.txt", encoding="UTF-8", sep = ";", header = TRUE, na.strings = "?")

newdate <- as.Date(ElecPwrConsum$Date, format = "%d/%m/%Y")
##strptime(ElecPwrConsum$Date, format = "%d/%m/%Y")
newdata <- cbind(ElecPwrConsum,newdate )
newdata1 <- subset(newdata, select = c(10,1:9) )
relevantdata <- subset (newdata1, newdate =='2007-02-01')
relevantdat2 <- subset (newdata1, newdate =='2007-02-02')
alldata <- rbind(relevantdata, relevantdat2)

alldata$datetime <- strptime(paste(alldata$Date, alldata$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

plot(alldata$datetime, alldata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")

points(alldata$datetime, alldata$Sub_metering_2, type = "l", xlab = "", ylab = "Energy Sub Metering", col ="red")
points(alldata$datetime, alldata$Sub_metering_3, type = "l", xlab = "", ylab = "Energy Sub Metering", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))
dev.off()