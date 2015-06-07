# Read and create working dataframe  
main.table<-read.table( "household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?" ) 
main.table<-transform(main.table,Date = as.Date(main.table$Date,"%d/%m/%Y"),Time =strptime(main.table$Time,format = "%H:%M:%S"))
working.table<-main.table[main.table$Date >= as.Date("01/02/2007","%d/%m/%Y") & main.table$Date <= as.Date("02/02/2007","%d/%m/%Y"),]

X<-length(tbl$Time)

png(file = "png4.png")
par(mfcol=c(2,2),xaxt="n",ps=10)     # set up canvass for four graphs, supress ticks, create smaller print size 

with(working.table,
    { plot(seq(X),as.numeric(Global_active_power),type ="l",xlab = "",ylab = "Global Active Power(Killowatts)")    # Plot first graph
      par(xaxt = "s")
      axis(1,at=seq(0,X,by = 1440),labels = c("Thur","Fri","Sat"))
      
      par(xaxt= "n")
      plot(seq(X),as.numeric(Sub_metering_1),type ="l",xlab = "",ylab = "Energy Sub Metering",col="black")          # Plot second graph with all lines  
      par(xaxt = "s")
      lines(seq(X),Sub_metering_2,col = "red")
      lines(seq(X),Sub_metering_3,col = "blue")
      axis(1,at=seq(0,X,by = 1440),labels = c("Thur","Fri","Sat"))
      legend("topright",pch = "_",col = c("black","red","blue"),legend=c("Sub_Metering1","Sub_Metering2","Sub_Metering3"),bty = 'n')
      
      par(xaxt="n")
      plot(seq(X),as.numeric(Voltage),type = "l",xlab="Datetime",ylab = "Voltage")                                  # Plot third graph
      par(xaxt="s")
      axis(1,at=seq(0,X,by = 1440),labels = c("Thur","Fri","Sat"))
      
      par(xaxt="n")                                                                                                 # Plot fourth graph
      plot(seq(X),as.numeric(Global_reactive_power),typ = "l",xlab = "Datetime",ylab = "Global_reactive_power")
      par(xaxt="n")
      axis(1,at=seq(0,X,by = 1440),labels = c("Thur","Fri","Sat"))
      
       } )

dev.off()
  