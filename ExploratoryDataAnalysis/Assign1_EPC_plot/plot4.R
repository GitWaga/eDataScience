#########################################################################################################
# Coursera: Peer Assessments / Exploratory Data Analysis                                                #
#                                                                                                       #
# Purpose:                                                                                              #
# To examine how household energy usage varies over a 2-day period in February, 2007.                   # 
#                                                                                                       #
#########################################################################################################



'*********************************************************************************
Name ......... : plot4
Desc ......... : produce Histogram. 
Author ....... : GitWaga
Version ...... : V1.0 (11/05/2014)
Licence ...... : GPL

Input ........ : data.frame
Output ....... : graphic device
**********************************************************************************'


plot4 <- function(subDFtoto) 
{
    png( 
        filename = "plot1.png",
        width = 480, 
        height = 480, 
        units = "px",
        bg = "white"
        )
    
    # Multiple Base Plots
    par( mfrow = c(2, 2) ,          # 4 figures arranged in 2 rows and 2 columns
         oma = c(1, 0, 0, 0)        # Set outer margin areas
        ) 
    
    with(subDFtoto, 
    {
        plot(
            datetime, Global_active_power, 
            type="l",
            xlab="", 
            ylab="Global Active Power"
        )
        plot(
            datetime, Voltage, 
            type="l",
            xlab="datetime", 
            ylab="Voltage"
        )        
        plot(   datetime, Sub_metering_1, 
                type = "l",
                xlab = "", 
                ylab ="Energy sub metering"
        ) 
        points(datetime, Sub_metering_2, type = "l", col = "red") 
        points(datetime, Sub_metering_3, type = "l", col = "blue")
        legend("topright", 
               inset = .02,
               cex = 0.7 ,
               col = c( "Black", "red", "blue" ), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty = "o", #bty: A character string which determined the type of box
               bg = "aliceblue", #colors(9),
               lty = rep(1,3) #lty=c(1,1,1) #pch = c(NA, NA, NA),
        )        
        plot(
            datetime, Global_reactive_power, 
            type="l",
            xlab="datetime", 
            ylab="Global reactive power"
        )        
    })
    
    
    dev.off()  ## Don't forget to close the PNG device!
    }