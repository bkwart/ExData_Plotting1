csv_file <- "household_power_consumption.txt"
df <- read.csv(csv_file, header = TRUE, sep = ";", colClasses = "character")

date_as_Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- df[date_as_Date == "2007-02-01" | date_as_Date == "2007-02-02",]

active_power <- as.numeric(df$Global_active_power)

png(file = "plot1.png")
hist(active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
