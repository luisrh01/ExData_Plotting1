# Coursera EDA Plot2
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
png(file="plot2.png", width=480, height=480)
plot(power$DateTime, power$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)"
)
dev.off()
