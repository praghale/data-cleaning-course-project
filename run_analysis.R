#Install and load data.table and dplyr
install.packages("data.table")
install.packages("dplyr")
library(data.table)
library(dplyr)

#Set working directory
setwd("/Users/praghale/Documents/Coursera")

#Import test dataset and rename some variables
x.test<-read.table("UCI HAR Dataset/test/X_test.txt")
y.test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject.test<-read.table("UCI HAR Dataset/test/subject_test.txt")
y.test<-rename(y.test,label=V1)
subject.test<-rename(subject.test,subject=V1)
test.data<-cbind(y.test,subject.test,x.test)


#Import training dataset and rename some variables
x.train<-read.table("UCI HAR Dataset/train/X_train.txt")
y.train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject.train<-read.table("UCI HAR Dataset/train/subject_train.txt")
y.train<-rename(y.train,label=V1)
subject.train<-rename(subject.train,subject=V1)
train.data<-cbind(y.train,subject.train,x.train)

#Merge the training and the test sets to create one data set
merged.data<-merge(test.data,train.data,by=intersect(names(test.data),names(train.data)),all=TRUE)

#Import features and activity names and rename variables
features<-read.table("UCI HAR Dataset/features.txt")
features$V1<-sub("^","V",features$V1)
activity<-read.table("UCI HAR Dataset/activity_labels.txt")
activity<-rename(activity,label=V1,activity=V2)

#Extract only the measurements on the mean and standard deviation for each measurement 
indices<-c(grep("mean()",features$V2,fixed=TRUE),grep("std()",features$V2,fixed=TRUE))
merged.data1<-merged.data[,c("label","subject",features[indices,1])]

#Uses descriptive activity names to name the activities in the data set
merged.data2<-merge(activity,merged.data1,by=intersect(names(merged.data1),names(activity)),all=TRUE)

#Label the data set with descriptive variable names.
column.names<-features[indices,2]
column.names<-gsub("-","_",column.names)
column.names<-gsub("\\(\\)","",column.names)
final.data<-data.table(merged.data2[,-1])
setnames(final.data, old = names(final.data)[3:68], new = column.names)


#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
avg.data<-final.data[,lapply(.SD,mean),by=.(activity,subject),.SDcols=3:68]
new_names<-paste("Avg_",colnames(avg.data)[3:68],sep="")
avg.data<-setnames(avg.data, old = names(avg.data)[3:68], new = new_names) 
write.table(avg.data,file="average_data.txt",row.names=FALSE)

