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

par(mfcol=c(2,2))

## Plot the graphs

## Global Active Power
plot(data$Datetime,as.numeric(data$Global_active_power),type="l",
     ylab="Global active power (kilowatt)",xlab="")

## Sub Metering
with(data ,{
        plot(data$Datetime,data$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)", xlab="")
        lines(data$Datetime,data$Sub_metering_2,type="l",col="red")
        lines(data$Datetime,data$Sub_metering_3,type="l",col="blue")
        
        
})

legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Voltge
plot(data$Datetime,data$Voltage,type="l",
     ylab="Voltage",xlab="Datetime")

##Global reactive power
plot(data$Datetime,data$Global_reactive_power,type="l",
     ylab="Global_reactive_power",xlab="Datetime")


## Copy into png
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
