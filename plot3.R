if(!file.exists("./data")){dir.create("./data")}
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "Dataset.zip")
unzip(zipfile = "./data/Dataset.zip",exdir = "./data")

bigdata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- bigdata[(bigdata$Date=="1/2/2007" | bigdata$Date=="2/2/2007" ), ]

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$time <- strptime(data$Time,format = "%H:%M:%S")
DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(DateTime)

with(data, {
  plot(DateTime,Sub_metering_1,xlab="",ylab="Energy Sub metering",type="l")
  lines(DateTime,Sub_metering_2, col='Red')
  lines(DateTime,Sub_metering_3, col='Blue')
})

legend("topright",lty=1,lwd=1,col=c("black","blue","red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",height=480, width=480)
dev.off()