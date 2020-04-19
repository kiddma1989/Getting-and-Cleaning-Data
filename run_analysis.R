#Read activity and features
activity_labels<-read.table('activity_labels.txt')
features<-read.table('features.txt')
features[,2]<-as.character(features[,2])
features[,2]<-gsub('-','',features[,2])

#extract columes with mean or std
featuresMeanTotal_num<-grep('.*mean.*|.*std.*',features[,2])
featuresMeanTotal<-features[featuresMeanTotal_num,2]
featuresMeanTotal<-gsub('mean','Mean',featuresMeanTotal)
featuresMeanTotal<-gsub('std','Std',featuresMeanTotal)
featuresMeanTotal<-gsub('[()]','',featuresMeanTotal)

#read train data
train<-read.table('train/X_train.txt')
train_sub<-read.table('train/subject_train.txt')
train_activity<-read.table('train/y_train.txt')
data_train<-cbind(train[,featuresMeanTotal_num],train_sub,train_activity)

#read test data
test<-read.table('test/X_test.txt')
test_sub<-read.table('test/subject_test.txt')
test_activity<-read.table('test/y_test.txt')
data_test<-cbind(test[,featuresMeanTotal_num],test_sub,test_activity)

#merge train data after test data and rename the data
data<-rbind(data_test,data_train)
colnames(data)<-c(featuresMeanTotal,'subject','activity')

#factor the activity and subject
data$activity<-factor(data$activity,levels = activity_labels[,1],labels = activity_labels[,2])
data$subject<-factor(data$subject)

#melt data with id = activity and subject
library(reshape2)
temp<-melt(data,id=c('activity','subject'))

#the mean value of each variable for each activity and subject
results<-dcast(temp,activity+subject~variable,mean)

#write results into a txt file
write.table(results,'tidy_data.txt',row.names = FALSE,quote = FALSE)
