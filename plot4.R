##
## Plot 4
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
png("plot4.png")

par(mfcol=c(2,2))

# Time / Global Active Power 
plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Time / Energy sub metering
plot(df$datetime,  df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue") 
legend( x="topright", 
        legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
        col=c("black","red", "blue"), lwd=1)

# Time / Voltage
plot(df$datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Time / Global Reactive Power
plot(df$datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()