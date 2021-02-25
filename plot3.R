setwd("C:/Users/CEID/Desktop/Online course/Data Science with R course/Projects In R - course 4")

# read lines from 2007/02/01 to 2007/02/02
two_day_min <- 24*60*2
first_day_min <- 23+17*60
difftime("2006-12-16","2007-02-01",units = "mins")
data<-read.table("household_power_consumption.txt", sep = ";", skip = (67680-first_day_min), nrows = two_day_min)
#get column names
col_name<-colnames(read.table("household_power_consumption.txt", sep = ";",header = T, nrows=1))
# rename columns
for (i in 1:9){
  names(data)[i] <- col_name[i]
}

# Create a column for DateTime format
data_plot2$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
# Create a column for corresponding day in the week
data_plot2$wday <- wday(data_plot2$DateTime, label = TRUE)

# plot line graph for global active power and save as png file
png(file = "plot3.png", width = 480, height = 480)
with(data_plot2, plot(data_plot2$Sub_metering_1~as.POSIXct(data_plot2$DateTime), ylab = "Energy sub metering", xlab = "", type = "l"))
lines(data_plot2$Sub_metering_2~as.POSIXct(data_plot2$DateTime),col = "red")
lines(data_plot2$Sub_metering_3~as.POSIXct(data_plot2$DateTime),col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(1,1), col=c("black","red","blue"))
dev.off()
