
#########################################################################################################
# Coursera: Peer Assessments / Exploratory Data Analysis                                                #
#                                                                                                       #
# Purpose:                                                                                              #
# To examine how household energy usage varies over a 2-day period in February, 2007.                   # 
#                                                                                                       #
#########################################################################################################



'*********************************************************************************
Name ......... : readData
Desc ......... : read and tranform data from a flat file. 
Author ....... : GitWaga
Version ...... : V1.0 (11/05/2014)
Licence ...... : GPL

Input ........ : NA
Output ....... : data.frame
**********************************************************************************'


readDATA <- function() 
{

    sampleData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5)
    classes <- sapply(sampleData, class)

    DFtoto <- read.table("household_power_consumption.txt",
                         header = TRUE,
                         colClasses = classes,
                         sep=";",
                         na.strings = "?",
                         comment.char = "",
                         nrows = 2075259 )
    #transform the vearaible 'Date' to date data type
    DFtoto$Date <- as.Date(DFtoto$Date, format = "%d/%m/%Y")
    #Subset the data
    subDFtoto <- subset(DFtoto, DFtoto$Date =="2007-02-01" | DFtoto$Date =="2007-02-02")
    #create a new varaible 'Datetime'
    subDFtoto$datetime <- strptime(paste(subDFtoto$Date, subDFtoto$Time), format = "%d/%m/%Y %H:%M:%S")
    
    #SAve the dataset in the global env
    tidydata <<- subDFtoto

}


'*********************************************************************************
!!!!!!!!!!!!                          Main                            !!!!!!!!!!!!
**********************************************************************************'


print("Assuming data source files: 'household_power_consumption.txt' ")
print("are availale in the current directory: 'DataSet_household_electric_power_consumption'")
print("The current directory should be your Working directory as well.")

if ( !exists("tidydata", envir=globalenv()) )
{
    print (Sys.time())
    print("--- Step 1 ---")
    print("Creating tidy data set...")
    readDATA()
    print (Sys.time())
}

print("--- Step 2 ---")
#step 2
userInput <- readline("Which Plot [1 - 4] to you want to generate?  ")
if ( userInput == 1 ) { plot1(tidydata) } 
else if ( userInput == 2 ) { plot2(tidydata) } 
else if ( userInput == 3 ) { plot3(tidydata) } 
else plot4(tidydata) 
print("The files is created")
#print("The files: plot" & as.character(userInput) & ".png is created")

