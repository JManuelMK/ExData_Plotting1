#======
#Plot 3
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

#Plot 3##############################
png('plot3.png',width = 480, height = 480)
with(my_data_subset,plot(Sub_metering_1~date_time,type='n',ylab='Energy sub metering',xlab=''))
with(my_data_subset,lines(Sub_metering_1~date_time,col='black'))
with(my_data_subset,lines(Sub_metering_2~date_time,col='red'))
with(my_data_subset,lines(Sub_metering_3~date_time,col='blue'))
legend('topright',col=c('black','red','blue'),lwd=c(1,1,1),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
#####################################
