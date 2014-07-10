library(datasets)
with(airquality,plot(Wind,Ozone,main="Ozone in New York City"))
title(main="Ozone and Wind in New York City")
with

data = read.table("household_power_consumption.txt", header = TRUE, sep = ";",)
head(data)
str(data)
data = transform(data,Date = as.Date(as.character(Date),"%d/%m/%Y"))
print(object.size(data), unit="Mb")

rawfile = file("household_power_consumption.txt", "r")
cat(grep("(^Date)|(^[1|2]/2/2007)", readLines(rawfile),value = TRUE), sep = "\n", file = "filtered.txt")
close(rawfile)
data = read.table("filtered.txt", header = TRUE, sep = ";",na.strings="?")
head(data)
str(data)
dim(data)
data = transform(data,Date = as.Date(as.character(Date),"%d/%m/%Y"))
data = transform(data,Time = as.character(Time))
mean(is.na(data))
time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data = data[,-c(1,2)]   ##Or data <- subset(data,select=-c(Date,Time))
data$time = time
data <- data[,c(8,1,2,3,4,5,6,7)]

plot(data$time, data$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
lines(data$time, data$Sub_metering_2, col="Red", type="l")
lines(data$time, data$Sub_metering_3, col="Blue", type="l")
legend("topright", pch = 1, col = c("Black", "Red", "Black"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png")
dev.off()