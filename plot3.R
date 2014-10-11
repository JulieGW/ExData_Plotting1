# Data source:
# note that the data is originally available from the website:
#https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#############################################################################################
# Reading in and creating a tidy data set
# Note that the data was loaded into a file called "data" on the working directory.
#
# The key to the tidy data set is a read statement that sets up the data they way it is needed.
# 
library(dplyr)
power<-read.table("./data/household_power_consumption.txt",header=T,stringsAsFactors=F,fill=T,sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")
onlydays<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")

# Because the second plot needs continuous time information, a column is added which combines the 
# date and time variables into a single time variable and converts it into POSIXct so that the 
# plotting system can recognize it as time. 

onlydays$DT<-as.POSIXct(paste(onlydays$Date,onlydays$Time),format="%d/%m/%Y %H:%M:%S")

###########################################################################################
# Plot the data

# This graph is build in layers.  First a blank plot is opened, and the largest variable in each
# axis is use for the x and y.  That scales it right.  The label for the vertical axis is put
# on at this step.  The next three lines of code add the lines one at a time assigning them their
# color as they go on.  The last command create the legend.  The lty=1 tells it that each legend
# symbol is a line.  Unlike type before, this is a one not the lower case L.

png(filename="./plot3.png")
plot(onlydays$DT,onlydays$Sub_metering_1,type="n",xlab=" ",ylab="Energy sub metering")
lines(onlydays$DT,onlydays$Sub_metering_1,col="black")
lines(onlydays$DT,onlydays$Sub_metering_2,col="red")
lines(onlydays$DT,onlydays$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()


