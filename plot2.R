##
## Plot 2
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
png("plot2.png")
plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()