# load libraries
# library(datasets)

# load data
file<-"household_power_consumption.txt"
data_all <- read.table(file, sep=";",header = TRUE,nrows=100000,stringsAsFactors=F,na.strings="?")

# Get data for dates from 2007-02-01 to 2007-02-02
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
data<-subset(data_all, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(data_all)

# Set dates in R format
DateTime <- paste(data$Date, data$Time)
data$DateTime<-strptime(DateTime,format="%Y-%m-%d %H:%M:%S") 

# Plot 3
Sys.setlocale("LC_TIME", "English")
par(mfrow=c(2,2))
  # Plot 1,1
  plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
  
  # Plot 1,2
  plot(data$DateTime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")

  # Plot 2,1
  plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
  lines(data$DateTime,data$Sub_metering_2,col="red")
  lines(data$DateTime,data$Sub_metering_3,col="blue")
  legend("topright",lty=1, y.intersp=0.7,cex=0.7,bty="n",col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  # Plot 2,2
  plot(data$DateTime,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
  
# Save plot
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
