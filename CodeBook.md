HAR CodeBook
============

Requires UCI HAR dataset from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


_X\_test.txt_ - data values; 1 row per measurement; column labels are in _features.txt_
_Y\_test.txt_ - activity values; 1 row per measurement; English descriptions are in _activity_labels.txt_
_subject\_test.txt_ - subject values; 1 row per measurement

Test and Train data has the same format.

Processing steps are to read in test and train data, combine, label activities, and create a summary data set with one subject per row and columns containing average for each feature mean and sd, per activity and per subject.
