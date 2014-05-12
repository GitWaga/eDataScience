#########################################################################################################
# Coursera: Peer Assessments / Exploratory Data Analysis                                                #
#                                                                                                       #
# Purpose:                                                                                              #
# To examine how household energy usage varies over a 2-day period in February, 2007.                   # 
#                                                                                                       #
#########################################################################################################


            #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
            #                                               #
            #       For re-use and performance matters      #
            #       The script: ReadDATAandPLOTS.R          #
            #       is the main program and contains        #
            #       the code to read the data               #
            #                                               #
            #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#


'*********************************************************************************
Name ......... : plot3
Desc ......... : produce Histogram. 
Author ....... : GitWaga
Version ...... : V1.0 (11/05/2014)
Licence ...... : GPL

Input ........ : data.frame
Output ....... : graphic device
**********************************************************************************'


plot3 <- function(subDFtoto) 
{
    png( 
        filename = "plot3.png",
        width  = 480, 
        height = 480, 
        units = "px",
        bg = "white"
    )
    
    with(subDFtoto,
         plot(datetime, Sub_metering_1, 
              type = "l",
              xlab = "", 
              ylab ="Energy sub metering"
         ) 
    )
    with(subDFtoto, points(datetime, Sub_metering_2, type = "l", col = "red") )
    with(subDFtoto, points(datetime, Sub_metering_3, type = "l", col = "blue") )
    
    
    legend("topright", 
           inset=.05,
           col = c( "Black", "red", "blue" ), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "o", #bty: A character string which determined the type of box
           bg = "aliceblue", #colors(9),
           lty = rep(1,3) #lty=c(1,1,1) #pch = c(NA, NA, NA),
    )
    #help(legend)
    
    dev.off()  ## Don't forget to close the PNG device!
}