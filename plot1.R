# Data source:
# note that the data is originally available from the website:
#https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
##################################################################################
# Reading in and creating a tidy data set
# Note that the data was placed in a file called "data" in the working directory.

# The secret here turned out to be the read the data in calling the collumn classes out and also
# replacing the "?" with NA.  If you don't to the replace with NA it can't handle a numeric with a
# question mark in it.  It is possible to make them all character, but then you have to convert them 
# all back from character to numeric (not impossible, it was just a bunch of lines of code)

library(dplyr)
power<-read.table("./data/household_power_consumption.txt",header=T,stringsAsFactors=F,fill=T,sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")
onlydays<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")

######################################################################################
# Create the actual histogram.  The scale on the two axises are correct by default
  # the title and horizontal axis label had to be added and the color made red
  
  png(filename="./plot1.png")
  hist(onlydays$Global_active_power,col="red",xlab="Global Active Power (kiliwatts)",main="Global Active Power")
  dev.off()


