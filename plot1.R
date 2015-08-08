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

## Plot the graph
hist(as.numeric(data$Global_active_power),main="Global active power",
     xlab="Global reactive power (kilowatt)",ylab="February",col="red")

## Copy into png
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
