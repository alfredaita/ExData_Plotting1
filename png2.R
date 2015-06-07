main.table<-read.table( "household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?" ) 
main.table<-transform(main.table,Date = as.Date(main.table$Date,"%d/%m/%Y"),Time =strptime(main.table$Time,format = "%H:%M:%S"))
working.table<-main.table[main.table$Date >= as.Date("01/02/2007","%d/%m/%Y") & main.table$Date <= as.Date("02/02/2007","%d/%m/%Y"),]

# Create number of items for X axis 
X<-length(tbl$Time)  

# open device
png(file = "png2.png")  

# temporaryil supress x axis ticks before plotting 
par(xaxt="n")
plot(seq(X),as.numeric(working.table$Global_active_power),type ="l",xlab = "",ylab = "Global Active Power(Killowatts")
# return tick before creating and labeling custom x axis
par(xaxt="s")
axis(1,at=seq(0,X,by = 1440),labels = c("Thur","Fri","Sat"))
# close device object
dev.off()

