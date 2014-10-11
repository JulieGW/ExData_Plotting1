# Data source:
# note that the data is originally available from the website:
#https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#############################################################################################
# Read in data and create a tidy data set
# The data has been loaded into a file called "data" on the working directory.
# The key to the tidy data set is a read statement that sets up the data they way it is needed.
# 
library(dplyr)
power<-read.table("./data/household_power_consumption.txt",header=T,stringsAsFactors=F,fill=T,sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")
onlydays<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")

# Because several plots need continuous time information, a column is added which combines the 
# date and time variables into a single time variable and converts it into POSIXct so that the 
# plotting system can recognize it as time. 

onlydays$DT<-as.POSIXct(paste(onlydays$Date,onlydays$Time),format="%d/%m/%Y %H:%M:%S")

###########################################################################################
# Plot the data


png(filename="./plot4.png")
par(mfrow=c(2,2))
#plot in position 1
plot(onlydays$DT,onlydays$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (killowatts)")

#plot in position 2
plot(onlydays$DT,onlydays$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot in position 3
plot(onlydays$DT,onlydays$Sub_metering_1,type="n",xlab=" ",ylab="Energy sub metering")
lines(onlydays$DT,onlydays$Sub_metering_1,col="black")
lines(onlydays$DT,onlydays$Sub_metering_2,col="red")
lines(onlydays$DT,onlydays$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#plot in position 4
plot(onlydays$DT,onlydays$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
