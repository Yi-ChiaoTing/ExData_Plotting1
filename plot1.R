if(!file.exists("./data")){dir.create("./data")}
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "Dataset.zip")
unzip(zipfile = "./data/Dataset.zip",exdir = "./data")

bigdata <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- bigdata[(bigdata$Date=="1/2/2007" | bigdata$Date=="2/2/2007" ), ]

hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col="red")
dev.copy(png,file="plot1.png")
dev.off()