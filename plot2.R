csv_file <- "household_power_consumption.txt"
df <- read.csv(csv_file, header = TRUE, sep = ";", colClasses = "character")

date_as_Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[date_as_Date == "2007-02-01" | date_as_Date == "2007-02-02",]

active_power <- as.numeric(df$Global_active_power)

vDateTimeString <- paste(df$Date, df$Time)
vDateTime <- as.POSIXct(vDateTimeString, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")
plot(vDateTime, active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
