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

# plot histogram for global active power and save as png file
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power,col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
