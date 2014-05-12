#########################################################################################################
# Coursera: Peer Assessments / Exploratory Data Analysis                                                #
#                                                                                                       #
# Purpose:                                                                                              #
# To examine how household energy usage varies over a 2-day period in February, 2007.                   # 
#                                                                                                       #
#########################################################################################################



'*********************************************************************************
Name ......... : plot1
Desc ......... : produce Histogram. 
Author ....... : GitWaga
Version ...... : V1.0 (11/05/2014)
Licence ...... : GPL

Input ........ : data.frame
Output ....... : graphic device
**********************************************************************************'


plot1 <- function(subDFtoto) 
{
    png( 
        filename = "plot1.png",
        width = 480, 
        height = 480, 
        units = "px",
        bg = "white"
        )
    
    hist( subDFtoto$Global_active_power, 
          #col = "red",
          col=rainbow(12),     # adds a rainbow pattern to graphics
          main ="Global Active Power", 
          breaks = 15,
          xlab="Global Active Power (kilowatts)")
    
    
    dev.off()  ## Don't forget to close the PNG device!
}