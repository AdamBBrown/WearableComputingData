#download the zip file from the url provided in the assignment
sourceurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipDestFile <- "./samsungfitdata.zip"
download.file(sourceurl, zipDestFile, mode="wb")
dateDownloaded <- date()

#unzip files
unzip(zipDestFile, overwrite = TRUE)

# 1. Merges the training and the test sets to create one data set.
        #read the column names
        columnNames <- read.table("./UCI HAR Dataset/features.txt")
        #read the test dataset
        testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
        #label the columns of the dataset
        names(testData) <- columnNames[,2]
        #read the train dataset
        trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
        #label the columns of the dataset
        names(trainData) <- columnNames[,2]

        #add activity ids and subject ids to dataset
        testData <- cbind(read.table("./UCI HAR Dataset/test/y_test.txt"), #activity ids
                          read.table("./UCI HAR Dataset/test/subject_test.txt"), #subject ids
                          testData)
        trainData <- cbind(read.table("./UCI HAR Dataset/train/y_train.txt"), #activity ids
                           read.table("./UCI HAR Dataset/train/subject_train.txt"), #subject ids
                           trainData)

        #merge the test & train datasets
        mergedData <- rbind(testData, trainData)
        #label the activity id
        names(mergedData)[1:2] <- c("activityid", "subjectid")
        
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        #extract the activityid column and add it to the std and mean columns
        mergedData <- cbind(mergedData$activityid, mergedData$subjectid, mergedData[,grepl("mean", names(mergedData)) | grepl("std", names(mergedData))])
        #rename activity id column
        names(mergedData)[1:2] <- c("activityid", "subjectid")

# 3. Uses descriptive activity names to name the activities in the data set
        #read the activity names list
        activityDescriptions <- read.table("./UCI HAR Dataset/activity_labels.txt")
        #label the columns
        names(activityDescriptions) <- c("activityid", "activitydescription")

        #merge the activity descriptions into the dataset
        mergedData <- merge(meanAndStdColumns, activityDescriptions, by.x = "activityid", by.y = "activityid")

# 4. Appropriately labels the data set with descriptive activity (column) names.
oldnames <- names(mergedData)
        #Rename columns with friendly names based on original feature set descriptions        
        names(mergedData)[1] = "Fitness Activity ID"            
        names(mergedData)[2] = "Test Subject ID"
        names(mergedData)[3] = "Body Acceleration Time Domain Signal Mean X"
        names(mergedData)[4] = "Body Acceleration Time Domain Signal Mean Y"             
        names(mergedData)[5] = "Body Acceleration Time Domain Signal Mean Z"
        names(mergedData)[6] = "Body Acceleration Time Domain Signal Standard Deviation X"
        names(mergedData)[7] = "Body Acceleration Time Domain Signal Standard Deviation Y"
        names(mergedData)[8] = "Body Acceleration Time Domain Signal Standard Deviation Z"
        names(mergedData)[9] = "Gravity Acceleration Time Domain Signal Mean X"
        names(mergedData)[10] = "Gravity Acceleration Time Domain Signal Mean Y"
        names(mergedData)[11] = "Gravity Acceleration Time Domain Signal Mean Z"
        names(mergedData)[12] = "Gravity Acceleration Time Domain Signal Standard Deviation X"
        names(mergedData)[13] = "Gravity Acceleration Time Domain Signal Standard Deviation Y"            
        names(mergedData)[14] = "Gravity Acceleration Time Domain Signal Standard Deviation Z"            
        names(mergedData)[15] = "Body Acceleration Time Jerk Signal Mean X"
        names(mergedData)[16] = "Body Acceleration Time Jerk Signal Mean Y"             
        names(mergedData)[17] = "Body Acceleration Time Jerk Signal Mean Z"             
        names(mergedData)[18] = "Body Acceleration Time Jerk Signal Standard Deviation X"
        names(mergedData)[19] = "Body Acceleration Time Jerk Signal Standard Deviation Y"
        names(mergedData)[20] = "Body Acceleration Time Jerk Signal Standard Deviation Z"
        names(mergedData)[21] = "Body Gyroscope Time Domain Signal Mean X"
        names(mergedData)[22] = "Body Gyroscope Time Domain Signal Mean Y"
        names(mergedData)[23] = "Body Gyroscope Time Domain Signal Mean Z"
        names(mergedData)[24] = "Body Gyroscope Time Domain Signal Standard Deviation X"
        names(mergedData)[25] = "Body Gyroscope Time Domain Signal Standard Deviation Y"
        names(mergedData)[26] = "Body Gyroscope Time Domain Signal Standard Deviation Z"
        names(mergedData)[27] = "Body Gyroscope Time Jerk Signal Mean X"
        names(mergedData)[28] = "Body Gyroscope Time Jerk Signal Mean Y"
        names(mergedData)[29] = "Body Gyroscope Time Jerk Signal Mean Z"
        names(mergedData)[30] = "Body Gyroscope Time Jerk Signal Standard Deviation X"
        names(mergedData)[31] = "Body Gyroscope Time Jerk Signal Standard Deviation Y"
        names(mergedData)[32] = "Body Gyroscope Time Jerk Signal Standard Deviation Z"
        names(mergedData)[33] = "Body Acceleration Time Domain Signal Mean Magnitude"
        names(mergedData)[34] = "Body Acceleration Time Domain Signal Standard Deviation Magnitude"
        names(mergedData)[35] = "Gravity Acceleration Time Domain Signal Mean Magnitude"
        names(mergedData)[36] = "Gravity Acceleration Time Domain Signal Standard Deviation Magnitude"
        names(mergedData)[37] = "Body Acceleration Time Jerk Signal Mean Magnitude"
        names(mergedData)[38] = "Body Acceleration Time Jerk Signal Standard Deviation Magnitude"
        names(mergedData)[39] = "Body Gyroscope Time Domain Signal Mean Magnitude"
        names(mergedData)[40] = "Body Gyroscope Time Domain Signal Standard Deviation Magnitude"
        names(mergedData)[41] = "Body Gyroscope Time Jerk Signal Mean Magnitude"
        names(mergedData)[42] = "Body Gyroscope Time Jerk Signal Standard Deviation Magnitude"
        names(mergedData)[43] = "Body Acceleration Frequency Domain Signal Mean X"
        names(mergedData)[44] = "Body Acceleration Frequency Domain Signal Mean Y"
        names(mergedData)[45] = "Body Acceleration Frequency Domain Signal Mean Z"
        names(mergedData)[46] = "Body Acceleration Frequency Domain Signal Standard Deviation X"
        names(mergedData)[47] = "Body Acceleration Frequency Domain Signal Standard Deviation Y"
        names(mergedData)[48] = "Body Acceleration Frequency Domain Signal Standard Deviation Z"
        names(mergedData)[49] = "Body Acceleration Frequency Domain Signal Mean Frequency X"
        names(mergedData)[50] = "Body Acceleration Frequency Domain Signal Mean Frequency Y"
        names(mergedData)[51] = "Body Acceleration Frequency Domain Signal Mean Frequency Z"
        names(mergedData)[52] = "Body Acceleration Frequency Jerk Signal Mean X"
        names(mergedData)[53] = "Body Acceleration Frequency Jerk Signal Mean Y"
        names(mergedData)[54] = "Body Acceleration Frequency Jerk Signal Mean Z"
        names(mergedData)[55] = "Body Acceleration Frequency Jerk Signal Standard Deviation X"
        names(mergedData)[56] = "Body Acceleration Frequency Jerk Signal Standard Deviation Y"
        names(mergedData)[57] = "Body Acceleration Frequency Jerk Signal Standard Deviation Z"
        names(mergedData)[58] = "Body Acceleration Frequency Jerk Signal Mean Frequency X"
        names(mergedData)[59] = "Body Acceleration Frequency Jerk Signal Mean Frequency Y"
        names(mergedData)[60] = "Body Acceleration Frequency Jerk Signal Mean Frequency Z"
        names(mergedData)[61] = "Body Gyroscope Frequency Domain Signal Mean X"
        names(mergedData)[62] = "Body Gyroscope Frequency Domain Signal Mean Y"
        names(mergedData)[63] = "Body Gyroscope Frequency Domain Signal Mean Z"
        names(mergedData)[64] = "Body Gyroscope Frequency Domain Signal Standard Deviation X"
        names(mergedData)[65] = "Body Gyroscope Frequency Domain Signal Standard Deviation Y"
        names(mergedData)[66] = "Body Gyroscope Frequency Domain Signal Standard Deviation Z"
        names(mergedData)[67] = "Body Gyroscope Frequency Domain Signal Mean Frequency X"
        names(mergedData)[68] = "Body Gyroscope Frequency Domain Signal Mean Frequency Y"
        names(mergedData)[69] = "Body Gyroscope Frequency Domain Signal Mean Frequency Z"
        names(mergedData)[70] = "Body Acceleration Frequency Domain Signal Mean Magnitude"
        names(mergedData)[71] = "Body Acceleration Frequency Domain Signal Standard Deviation Magnitude"
        names(mergedData)[72] = "Body Acceleration Frequency Domain Signal Mean Frequency"
        names(mergedData)[73] = "Body Acceleration Body Frequency Jerk Signal Mean Magnitude"
        names(mergedData)[74] = "Body Acceleration Body Frequency Jerk Signal Standard Deviation Magnitude"
        names(mergedData)[75] = "Body Acceleration Body Frequency Jerk Signal Signal Mean Frequency Magnitude"
        names(mergedData)[76] = "Body Gyroscope Body Frequency Domain Signal Mean Magnitude"
        names(mergedData)[77] = "Body Gyroscope Body Frequency Domain Signal Standard Deviation Magnitude"
        names(mergedData)[78] = "Body Gyroscope Body Frequency Domain Signal Mean Frequency Magnitude"
        names(mergedData)[79] = "Body Gyroscope Body Frequency Jerk Signal Mean Magnitude"
        names(mergedData)[80] = "Body Gyroscope Body Frequency Jerk Signal Standard Deviation Magnitude"
        names(mergedData)[81] = "Body Gyroscope Body Frequency Jerk Signal Mean Frequency Magnitude"
        names(mergedData)[82] = "Description Of Fitness Activity"

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
        #create tidy dataset grouping by fitness activity id and test subject id
        tidyData <- aggregate(mergedData[1:81], by=list(mergedData$"Fitness Activity ID", mergedData$"Test Subject ID"), FUN=mean)
        #add descriptions of fitness activities.
        tidyData <- merge(tidyData, activityDescriptions, by.x = "Fitness Activity ID", by.y = "activityid")
        #fix column names to add "Mean of" because we are now looking at the mean of the mean/std values
        names(tidyData)[3:81] <- sub("Mean", "Mean of Mean", names(mergedData)[3:81])
        names(tidyData)[3:81] <- sub("Standard Deviation", "Mean of Standard Deviation", names(mergedData)[3:81])
        #write the tidy table to the working directory
        write.table(tidyData, "./tidysamsungfitdata.txt", append=FALSE, sep=",")
