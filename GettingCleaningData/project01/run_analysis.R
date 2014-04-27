#########################################################################################################
# Coursera: Peer Assessments / Getting and Cleaning Data Project                                        #
#                                                                                                       #
# Purpose:                                                                                              #
# To demonstrate your ability to collect, work with, and clean a data set.                              #   
# The goal is to prepare tidy data that can be used for later analysis.                                 #
#                                                                                                       #
# One of the most exciting areas in all of data science right now is wearable computing                 #
# Fitbit, Nike,... are racing to develop the most advanced algorithms to attract new users.             #
# The data are collected from the accelerometers from the Samsung Galaxy S smartphone.                  #
#########################################################################################################



'*********************************************************************************
Name ......... : readData
Desc ......... : Merges the x, y and subjects sets to create one data set. 
Author ....... : GitWaga
Version ...... : V1.0 (27/04/2014)
Licence ...... : GPL

Input ........ : file name suffix, file directory name
Output ....... : data.frame
**********************************************************************************'

readData <- function(filename_suffix, filepathdir) 
        {
        
        # initialisation
        DFtoto <- data.frame()
        
        # read the y data file
        filepath <- file.path(filepathdir, paste("y_", filename_suffix, ".txt", sep =""))
        y_data <- read.table(filepath, header=F, col.names=c("ActivityID"))
        
        # read the subject data file
        filepath <- file.path(filepathdir, paste("subject_", filename_suffix, ".txt", sep =""))
        s_data <- read.table(filepath, header=F, col.names=c("SubjectID"))
        
        # read the X data file
        filepath <- file.path(filepathdir, paste("X_", filename_suffix, ".txt", sep =""))
        # first get the column names in the file: features.txt
        x_dataCols <- read.table("features.txt", header=F, as.is=T, col.names=c("MeasureID", "MeasureName"))
        x_data <- read.table(filepath, header=F, col.names = x_dataCols$MeasureName)
        # extracts only the measurements on the mean and standard deviation for each measurement. 
        x_data <- x_data[,grep(".*mean\\(\\)|.*std\\(\\)", x_dataCols$MeasureName)]
        
        # create the return data frame
        DFtoto <- y_data
        DFtoto$SubjectID  <- s_data$SubjectID
        DFtoto <- cbind(DFtoto, x_data)
        
        # and return it
        return (DFtoto)
        }


'*********************************************************************************
Name ......... : UnionData
Desc ......... : Merges the training and the test sets to create one data set.
Author ....... : GitWaga
Version ...... : V1.0 (27/04/2014)
Licence ...... : GPL

Input ........ : data.frame
Output ....... : data.frame
**********************************************************************************'

UnionData <- function() 
        {
        DFtoto <- rbind( readData("test", "test") , readData("train", "train") )
        # rename the columns
        cnames <- colnames(DFtoto)
        cnames <- gsub("\\.+mean\\.+", cnames, replacement="Mean")
        cnames <- gsub("\\.+std\\.+" , cnames, replacement="Std" )
        colnames(DFtoto) <- cnames
        # Add the activity names (new column)
        labels <- read.table("activity_labels.txt", header=F, as.is=T, col.names=c("ActivityID", "ActivityName"))
        labels$ActivityName <- as.factor(labels$ActivityName)
        # merge with ActivityID
        DFtoto <- merge(labels, DFtoto)
        DFtoto <- within(DFtoto, rm("ActivityID"))
        
        return (DFtoto)
        }

'*********************************************************************************
Name ......... : SummaryTidyData
Desc ......... : Creates a second, independent tidy data set 
                 with the average of each variable for each activity and each subject.
Author ....... : GitWaga
Version ...... : V1.0 (27/04/2014)
Licence ...... : GPL

Input ........ : data.frame
Output ....... : data.frame
**********************************************************************************'

SummaryTidyData <- function(DFtoto) 
        {
        library(reshape2)
        #dim_vars = c("ActivityID", "ActivityName", "SubjectID")
        dim_vars = c("ActivityName", "SubjectID")
        fact_vars = setdiff(colnames(DFtoto), dim_vars)
        SumDFtoto <- melt(DFtoto, id = dim_vars , measure.vars = fact_vars)
        
        return (SumDFtoto)
        }



'*********************************************************************************
!!!!!!!!!!!!                          Main                            !!!!!!!!!!!!
**********************************************************************************'

print("Assuming data source files are availale in the current directory:'UCI HAR Dataset'")
print("The the current directory should be your Working directory as well.")
print (Sys.time())
print("Creating tidy data set...")
#step 1
tidydata <- UnionData()
write.table(tidydata, "run_TidyData.txt")
print("The files: run_TidyData.txt is created")
#step 2
sumtidydata <- SummaryTidyData(tidydata)
write.table(sumtidydata, "run_SummaryTidyData.txt")
print("The files: run_SummaryTidyData.txt is created")
print (Sys.time())


