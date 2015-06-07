# Read and create working dataframe  
main.table<-read.table( "household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?" ) 
main.table<-transform(main.table,Date = as.Date(main.table$Date,"%d/%m/%Y"),Time =strptime(main.table$Time,format = "%H:%M:%S"))
working.table<-main.table[main.table$Date >= as.Date("01/02/2007","%d/%m/%Y") & main.table$Date <= as.Date("02/02/2007","%d/%m/%Y"),]

#create sequence for plot of x values 
X<-length(working.table$Time)                                          

# open device object and name the file for saving 
png(file = "png3.png")                                      

# temporarily  supress default ticks 
par(xaxt="n")                               

# plot the main 
plot(seq(X),as.numeric(working.table$Sub_metering_1),type ="l",xlab = "",ylab = "Energy Sub Metering",col="black")
# unsupress default ticks
par(xaxt="s")                                                       

axis(1,at=seq(0,X,by = 1440),labels = c("Thur","Fri","Sat"))        # create custom axis
lines(seq(X),working.table$Sub_metering_2,col = "red")              # plot second line 
lines(seq(X),working.table$Sub_metering_3,col = "blue")             # plot third line

# create legend
legend("topright",pch = "_",col = c("black","red","blue"),legend=c("Sub_Metering1","Sub_Metering2","Sub_Metering3"))
# close device object
dev.off()                                                                                                              