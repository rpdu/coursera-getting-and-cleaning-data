# load useful libraries
library(dplyr)

# verify if UCI HAR Dataset.zip exists in ./data directory, if not download file.  
if(!file.exists("./UCI HAR Dataset.zip")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile="./data/UCI HAR Dataset.zip")
}
# extract file if "/data/UCI HAR Dataset" directory is not present
if(!file.exists("./UCI HAR Dataset")){
        unzip("./UCI HAR Dataset.zip", files = NULL, list = FALSE, overwrite = TRUE,
              junkpaths = FALSE, exdir = "/UCI HAR Dataset", unzip = "internal",
              setTimes = FALSE)
}


## preparation of generic data to apply to both test and train sets

#read features.txt into data frame to later populate test and train measurement column headers
features <- read.table("./UCI HAR Dataset/features.txt",sep = " ")
#read activity_labels.txt into data frame to later populate  test and train activity labels 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",sep = " ")

## prepare train data set

#read column of Subjects into data frame
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#add "subject" as column name 
names(subject_train)<-"subject"
#read Training labels into data frame
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
#add "activity" to Training label column name 
names(y_train)<-"activity"
#read Training measurements set into data frame
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
#add column names from features as required in Assignment step 4.
names(X_train)<-features[,2]

#combine train activities to measurements and combine with subjects 
train<-cbind(y_train,X_train)
train<-cbind(subject_train,train)

## prepare test data set

#read column of Subjects into data frame
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#add "subject" as column name 
names(subject_test)<-"subject"
#read test labels into data frame
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
#add "activity" to test label column name
names(y_test)<-"activity"
#read test measurements set into data frame
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
#add column names from features as required in Assignment step 4. 
names(X_test)<-features[,2]

#combine test activities to measurements and combine with subjects
test<-cbind(y_test,X_test)
test<-cbind(subject_test,test)

## --- Assignment steps 

#Assignment step 1. - Merge both data sets
train_test<-rbind(train,test)

#Assignment step 2. - Extract only the measurements on the mean and standard deviation for each measurement. 
#find and return columns meeting regular expression for mean and standard deviation
std_means<- train_test[ , grepl( "subject|activity|mean()|std()|Mean)" , names(train_test))] 
#filter out meanFreq as it is a frequency of means and not the mean or average of anything.
std_means<- std_means[ , !grepl( "meanFreq()" , names(std_means))] 

#Assignment step 3. - Uses descriptive activity names to name the activities in the data set
std_means$activity <- activity_labels[,2][match(std_means$activity, activity_labels[,1])]

#Assignment step 4. - Appropriately labels the data set with descriptive variable names. 
#This step was previously carried out as last step in preparation of train and test data sets (see code line numbers 23-24 and 42-43).

#Assignment step 5. - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
independent_tidy_data_set <- std_means%>%group_by(subject,activity)%>%summarise_all(mean)%>%arrange(subject,activity)
#Rename the measurement columns to "Means_of_"
names(independent_tidy_data_set)[3:74]<-paste("Means_of_",names(independent_tidy_data_set)[3:74], sep="")
# write independent_tidy_data_set to tidy_data_set.txt file in "./UCI HAR Dataset" directory
write.table(independent_tidy_data_set,"./UCI HAR Dataset/tidy_data_set.txt",sep = " ",row.names = FALSE)
View(independent_tidy_data_set)
