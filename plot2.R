## Download the Zip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./Data"
              ,method="libcurl")

## unzip the data
unzip("Zipped Data",exdir="./UnzippedData")

data_full <- read.csv("./UnzippedData/household_power_consumption.txt",header=TRUE,
                      sep=";")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot the graph
plot(data$Datetime,as.numeric(data$Global_active_power),type="l",main="Global active power",
     ylab="Global active power (kilowatt)",xlab="")


## Copy into png
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
