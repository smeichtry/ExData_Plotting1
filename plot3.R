##
## Plot 3
##

read_data <- function() {
    df <- read.csv(file='./household_power_consumption.txt', header=TRUE, sep=';', na.strings = c('?'))
    df <- df[grepl('^[1,2]{1}/2/2007$', df$Date),]
    df$datetime <- strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%S')
    df$Time <- NULL
    df$Date <- NULL
    df
}

# Read the data of the two days period (1th and 2th Feb 2007).
df <- read_data()

# Create the plot.
png("plot3.png")
plot(df$datetime,  df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue") 
legend( x="topright", 
        legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
        col=c("black","red", "blue"), lwd=1)
dev.off()