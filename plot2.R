csv_file <- "household_power_consumption.txt"
df <- read.csv(csv_file, header = TRUE, sep = ";", colClasses = "character")

vDate <- as.Date(df$Date, format = "%d/%m/%Y")
filter <- vDate == '2007-02-01' | vDate == '2007-02-02'

active_power <- as.numeric(df$Global_active_power[filter])

vDateTimeString <- paste(df$Date[filter], df$Time[filter])
vDateTime <- as.POSIXct(vDateTimeString, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")
plot(vDateTime, active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
