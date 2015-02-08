##
## Plot 1
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

# Make a quick summary and show begin and end of data.
str(df)
head(df, n=3)
tail(df, n=2)

# Create the plot.
png("plot1.png")
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()