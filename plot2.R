#Download and read the file
if(!file.exists("./data")){dir.create("./data")}
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "Dataset.zip")
unzip(zipfile = "./data/Dataset.zip",exdir = "./data")

#subset data
bigdata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- bigdata[(bigdata$Date=="1/2/2007" | bigdata$Date=="2/2/2007" ), ]

#set date and time
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$time <- strptime(data$Time,format = "%H:%M:%S")
DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(DateTime)

#plot and store the file in png device
with(data,plot(DateTime,Global_active_power,xlab = "",ylab="Global Active Power(kilowatts)",type = "l"))
dev.copy(png,file="plot2.png",height=480, width=480)
dev.off()
