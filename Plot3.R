#Process the data

project<-read.csv("Dataproject.txt", sep=";", stringsAsFactor=FALSE)  ## Read the Tiny Data, avoid columns as class Factor
project$Time<-paste(project$Date, project$Time, sep=" ")    ## Merge the date and the time in one column
project$Date<-as.Date(project$Date, format="%d/%m/%Y")     ## Convert column Dates into class Date, just needed to obtain the tiny data 
project$Time<-as.POSIXct(project$Time, format="%d/%m/%Y %H:%M:%S")  ## Convert the class character to POSIXct

## Plot 3
plot(project$Time,project[,7], type="n", ylab="Energy sub metering", xlab="") ## Empty plot
lines(project$Time,project[,7], col="Black") ## Add line sub_metering_1
lines(project$Time,project[,8], col="Red")   ## Add line sub_metering_2
lines(project$Time,project[,9], col="Blue")  ## Add line sub_metering_3
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("Black","Red","Blue"))
dev.copy(png, file= "Plot3.png")
dev.off()