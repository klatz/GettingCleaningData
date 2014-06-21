#YOU NEED plyr & reshape2 package
library(plyr)
library(reshape2)

#STEP 1
#read training dataset 
        #subject:who y:activity
sub_train <- read.csv("UCI HAR Dataset/train/subject_train.txt",header=FALSE)
X_train   <- read.csv("UCI HAR Dataset/train/X_train.txt",sep="",header=FALSE)  
y_train   <- read.csv("UCI HAR Dataset/train/y_train.txt",header=FALSE) 

#read test dataset
sub_test  <- read.csv("UCI HAR Dataset/test/subject_test.txt",header=FALSE)
X_test    <- read.csv("UCI HAR Dataset/test/X_test.txt",sep="",header=FALSE) 
y_test    <- read.csv("UCI HAR Dataset/test/y_test.txt",header=FALSE) 

#merge training dataset
        train_marge <- cbind(X_train,sub_train,y_train)

#merge test dataset
        test_marge <- cbind(X_test, sub_test, y_test)

#marge training+test dataset
        marge_dataset <- rbind(train_marge,test_marge)

#read features
        features <- read.csv("UCI HAR Dataset/features.txt",sep="",header=FALSE)
        feature_names <- c(as.vector(features[,2]),"person","activity")

#STEP 4
#set column names
colnames(marge_dataset) <- feature_names

#STEP 3
#read activities list
        activities <- read.csv("UCI HAR Dataset/activity_labels.txt"
                                                        ,sep="",header=FALSE)
colnames(activities) <- c("activity","activity_name")
marge_dataset <- join(marge_dataset,activities,by="activity")

#STEP 2
#choose mean/standard deviation names
        mean_standard_names <- grepl('mean\\(\\)|std\\(\\)',names(marge_dataset))
#add X and y col
        mean_standard_names[ncol(marge_dataset)-2]<-TRUE #person
        mean_standard_names[ncol(marge_dataset)]<-TRUE   #activities
#extract mean/standard dataset
        mean_standard_dataset <- marge_dataset[,mean_standard_names]

#WRITE CSV&TXT extract data
        write.csv(mean_standard_dataset,"tidy_dataset_1.csv")
        write.table(mean_standard_dataset,"tidy_dataset_1.txt",quote=FALSE)

#STEP 5
        aggregate_dataset <- aggregate(.~ person + activity_name ,data=mean_standard_dataset,FUN=mean)

#WRITE CSV&TXT extract data
        write.csv(aggregate_dataset,"tidy_dataset_2.csv")
        write.table(aggregate_dataset,"tidy_dataset_2.txt",quote=FALSE)
