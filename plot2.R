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

# Plot 2
Sys.setlocale("LC_TIME", "English")
plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Save plot
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
