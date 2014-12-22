HAR CodeBook
============

Requires UCI HAR dataset from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

_X\_test.txt_ - data values; 1 row per measurement; column labels are in _features.txt_

_Y\_test.txt_ - activity values; 1 row per measurement; English descriptions are in _activity_labels.txt_

_subject\_test.txt_ - subject values; 1 row per measurement

Test and Train data has the same format.

For more information on the input formats, see the description in the UCI HAR Dataset.zip README.

Processing steps are to read in test and train data, combine, label activities, and create a summary data set.

The generated file is named _output.txt_.

There are columns for each mean and standard deviation of features from the UCI HAR Dataset, per activity.

There is one subject per row (each subject from the initial data set).

The values provided are the average for each feature mean and sd, per activity.  Note that the units are the same as in the original data set, see the README from that data set for more details.

What this means is the dataset provides an overall picture of each feature value for each activity and you can see how this varies by subject.
