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
Name ......... : plot2
Desc ......... : produce plot. 
Author ....... : GitWaga
Version ...... : V1.0 (11/05/2014)
Licence ...... : GPL

Input ........ : data.frame
Output ....... : graphic device
**********************************************************************************'

plot2 <- function(subDFtoto) 
{

    png(    filename = "plot2.png",
            width  = 480, 
            height = 480, 
            units = "px",
            bg = "white"
        )

    with(subDFtoto, 
         plot(datetime, Global_active_power, 
                type="l",           # Plot lines and points. Use "p" for points only, "l" for lines only
                xlab="",            # Label for the x-axis 
                ylab="Global Active Power (kilowatts)",     # Label for the y-axis
                font.lab=2,         # Font to use for the axis labels: 1=plain text, 2=bold, 3=italic, 4=bold italic 
                bty="l",            # Box around plot to contain only left and lower lines 
                lty=1               # Line type: 0=blank, 1=solid, 2=dashed, 3=dotted, 4=dotdash, 5=longdash, 6=twodash 
            ) 
        )
       
    dev.off()  ## Don't forget to close the PNG device!

}