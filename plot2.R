# Data source:
# note that the data is originally available from the website:
#https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#############################################################################################
# Reading in and create a tidy data set

# Note that the data was loaded into a file called "data" in the working directory.
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

# Plot 2 is a scatter plot with the type being set to l for line.  The labels are done the 
# same way as is done for plot 1.

png(filename="./plot2.png")
plot(onlydays$DT,onlydays$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (killowatts)")
dev.off()