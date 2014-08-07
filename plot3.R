csv_file <- "household_power_consumption.txt"
df <- read.csv(csv_file, header = TRUE, sep = ";", colClasses = "character")

vDate <- as.Date(df$Date, format = "%d/%m/%Y")
filter <- vDate == '2007-02-01' | vDate == '2007-02-02'

subMetering1 <- as.numeric(df$Sub_metering_1[filter])
subMetering2 <- as.numeric(df$Sub_metering_2[filter])
subMetering3 <- as.numeric(df$Sub_metering_3[filter])

vDateTimeString <- paste(df$Date[filter], df$Time[filter])
vDateTime <- as.POSIXct(vDateTimeString, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")
plot(vDateTime, subMetering1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(vDateTime, subMetering1, col = "black")
lines(vDateTime, subMetering2, col = "red")
lines(vDateTime, subMetering3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = "solid",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
