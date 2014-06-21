GettingCleaningData
===================
Getting and Cleaning Data Course Project

run_analysis.R implements this project.

To run this script R need plyr and reshape2 package installed.
Original data files must be in "UCI HAR Dataset" directory below 
the working directory.

This script consists of 2 parts.
The first part is for assignment step1 to step4 to make a tidy data set
which is the tringing and the test sets are merged.
The second part is for step5 to make another tidy data set which shows 
the average of each variable for each activity and each subject. 

The flow of the script
STEP1 
        Read original data (trainging and test set)
                subject_train/test.txt
                X_train/test.txt
                y_train/test.txt
        Merge each data, activities list and subjects
        Merge training and test data set 
        
STEP4
        Read variable names
                features.txt
        Set column names 

STEP3
        Read activities list
                activity_labels.txt
        Add activity names to the data set

STEP2 
        Extract columns which has name with "mean()" or "std()"
                and subject/acitivity name
        
Save CSV and TXT file with the first data set.

STEP5
        Creates the second tidy data set with the average of each variable 
        for each activity and each subject

Save CSV and TXT file with the second data set.