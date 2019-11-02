# Coursera EDA Plot1
# download file and unzip
downloadFile <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                              destfile = "household_power.zip")
unzip("household_power.zip")
# remove zip file as no longer needed
unlink("household_power.zip")

# read text file and convert date/time fields for analysis
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")

# keep only dates requested for process
power <- subset(power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Save plot as PNG
png(file="plot1.png", width=480, height=480)
hist(power$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power", 
     breaks = 13, 
     ylim = c(0,1200), 
     xlim = c(0, 6)
)
dev.off()
