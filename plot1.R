#======
#Plot 1 
#======

####Load and subset the Data#####
library(dplyr)

#Load data
###Using sed I substitute the ? for NA
####sed -E -e 's/\?/NA/g' household_power_consumption.txt > household_power_consumption_withNA.txt

my_data<-read.table('./household_power_consumption_withNA.txt',sep=';',header=TRUE,na.strings = 'NA') 

#Inspect data
class(my_data)
head(my_data)
tail(my_data)

#Make column date to date type
my_data$Date<-as.Date(my_data$Date,'%d/%m/%Y') 
head(my_data)

#Combine the time of day and the date
date_time<-paste(my_data_subset$Date,my_data_subset$Time)
my_data_subset$date_time<-as.POSIXct(date_time)
head(my_data_subset)

#Subset the data
my_data_subset <- filter(my_data,Date>=as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
###################################

#Plot 1##############################
png('plot1.png',width = 480, height = 480)
with(my_data_subset,hist(Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)'))
dev.off()
#####################################
