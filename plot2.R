ElecPwrConsum <- read.table("household_power_consumption.txt", encoding="UTF-8", sep = ";", header = TRUE, na.strings = "?")

newdate <- as.Date(ElecPwrConsum$Date, format = "%d/%m/%Y")
##strptime(ElecPwrConsum$Date, format = "%d/%m/%Y")
newdata <- cbind(ElecPwrConsum,newdate )
newdata1 <- subset(newdata, select = c(10,2:9) )
relevantdata <- subset (newdata1, newdate =='2007-02-01')
relevantdat2 <- subset (newdata1, newdate =='2007-02-02')
alldata <- rbind(relevantdata, relevantdat2)
#as.numeric(alldata$Global_active_power)
#dirtydata <- alldata[(alldata$Global_active_power =="?"),] 
#hist(alldata$Global_active_power)
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")