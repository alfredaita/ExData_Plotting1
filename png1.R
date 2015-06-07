# Read data and create table   

main.table<-read.table( "household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?" ) 
main.table<-transform(main.table,Date = as.Date(main.table$Date,"%d/%m/%Y"),Time =strptime(main.table$Time,format = "%H:%M:%S"))
working.table<-main.table[main.table$Date >= as.Date("01/02/2007","%d/%m/%Y") & main.table$Date <= as.Date("02/02/2007","%d/%m/%Y"),]

png(file="png1.png")
hist(as.numeric(working.table$Global_active_power),freq=T,col="red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")

dev.off()
