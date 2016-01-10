# load libraries
# library(datasets)

# load data
file<-"household_power_consumption.txt"
data_all <- read.table(file, sep=";",header = TRUE,nrows=100000,stringsAsFactors=F,na.strings="?")

# Get data for dates from 2007-02-01 to 2007-02-02
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
data<-subset(data_all, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(data_all)

# Plot 1
hist(data$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab="Frequency",col="red")

# Save plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
