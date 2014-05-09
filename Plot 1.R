##Process the data
##I have created a tiny data file with the data of the selected days, to avoid the use of a txt file of 100MB
project<-read.csv("Dataproject.txt", sep=";", stringsAsFactor=FALSE)  ## Read the Tiny Data, avoid columns as class Factor
project$Time<-paste(project$Date, project$Time, sep=" ")    ## Merge the date and the time in one column
project$Date<-as.Date(project$Date, format="%d/%m/%Y")     ## Convert column Dates into class Date, just needed to obtain the tiny data 
project$Time<-as.POSIXct(project$Time, format="%d/%m/%Y %H:%M:%S")  ## Convert the class character to POSIXct

##Plot 1
hist(project$Global_active_power, col="Red", breaks=12, main= "Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.copy(png, file= "Plot1.png")
dev.off()
