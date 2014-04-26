### Introduction

This file is run against the raw data collected from fitness hardware. Its output is a new tidy dataset that calculates the mean
for all the mean and standard deviation columns in the data set and summarizes them by activity and subject. The following steps
were performed in the script to take the raw data files and turn them into tidy data.

1. Download the raw data into the current working directory in file called samsungfitdata.zip
2. Read 5 files (2 datasets (test+train), both of the files for activity labels, and the column labels) into memory
3. Merge the test and train data sets and assign initial column names
4. Then create a new data frame of just the mean and standard deviation measurements from the original raw data
5. Then we add full descriptions for the activity names
6. Next we added specific column names from the original documentation from the raw data.
7. Lastly we create our tidy dataset by:
        - calculating the means of our mean/std dataset
        - grouping by activity and subject
        - changing labels to indicate the new column headings as mean of means.
        