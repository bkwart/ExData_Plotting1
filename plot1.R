csv_file <- "household_power_consumption.txt"
df <- read.csv(csv_file, header = TRUE, sep = ";", colClasses = "character")

vDate <- as.Date(df$Date, format = "%d/%m/%Y")
active_power <- as.numeric(df$Global_active_power[vDate == '2007-02-01' | vDate == '2007-02-02'])

png(file = "plot1.png")
hist(active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
