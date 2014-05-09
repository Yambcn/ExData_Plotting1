##Process the data

project<-read.csv("Dataproject.txt", sep=";", stringsAsFactor=FALSE)  ## Read the Tiny Data, avoid columns as class Factor
project$Time<-paste(project$Date, project$Time, sep=" ")    ## Merge the date and the time in one column
project$Date<-as.Date(project$Date, format="%d/%m/%Y")     ## Convert column Dates into class Date, just needed to obtain the tiny data 
project$Time<-as.POSIXct(project$Time, format="%d/%m/%Y %H:%M:%S")  ## Convert the class character to POSIXct

##Plot 4
par(mfrow=c(2,2))
plot(project$Time, project$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(project$Time, project$Voltage, type="l", xlab="datatime", ylab="Voltage")
plot(project$Time,project[,7], type="n", ylab="Energy sub metering", xlab="")
lines(project$Time,project[,7], col="Black")
lines(project$Time,project[,8], col="Red")
lines(project$Time,project[,9], col="Blue")
legend("topright", bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("Black","Red","Blue"), cex=0.8) ## Legend without box
plot(project$Time, project$Global_reactive_power, type="l", xlab="datatime", ylab="Global_reactive_power")
dev.copy(png, file= "Plot4.png")
dev.off()