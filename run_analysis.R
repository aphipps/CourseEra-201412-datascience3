# load libs (for melt)
library(reshape2)

# read column names for X data
feat<-read.table("features.txt")
# ensure they are usable as column names
colNames <- make.names(feat$V2)

# set up col classes, use NULL where we don't need the col otherwise numeric
colClasses <- ifelse(grepl("\\.std\\.|\\.mean\\.",colNames),"numeric","NULL")

# load train data
xtrain<-read.table("train/X_train.txt",col.names=colNames, colClasses=colClasses)
ytrain<-read.table("train/y_train.txt",col.names=c("activity"))
subjtrain<-read.table("train/subject_train.txt",col.names=c("subject"))
traindata<-cbind(xtrain,ytrain,subjtrain)

# load test data
xtest<-read.table("test/X_test.txt",col.names=colNames, colClasses=colClasses)
ytest<-read.table("test/y_test.txt",col.names=c("activity"))
subjtest<-read.table("test/subject_test.txt",col.names=c("subject"))
testdata<-cbind(xtest,ytest,subjtest)

# bring test and train data together
combineddata<-rbind(testdata,traindata)

# add activity labels
actlabels<-read.table("activity_labels.txt",col.names=c("activity","activityLabel"))
data<-merge(actlabels,combineddata)

# break down to have vars as labeled rows
meltedData<-melt(data,id=c("activity", "activityLabel", "subject"))

# create summary data; one subject per row with average of values.  Column name indicates activity and variable (measurement name)
final<-as.data.frame(tapply(meltedData$value,list(meltedData$subject,meltedData$activityLabel,meltedData$variable),mean))

# write out
write.table(final, file="output.txt", row.name=F)
