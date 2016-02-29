#run_analysis will
#1. Merges the training and test sets to create one data set
#2. Extracts only the measurements on the mean and standard deviation for each measurement
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for for each activity and each subject. 

#Import the subject test vector subject_test
subject_test <- read.table("~/Downloads/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
#Import the test data and store into X_test
X_test <- read.table("~/Downloads/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
#Import the test labels
y_test <- read.table("~/Downloads/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
#Import the activity labels so we can replace them



# Import the subject train vector subject_train
subject_train <- read.table("~/Downloads/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
#Import the train data and store into X_train
X_train <- read.table("~/Downloads/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
#Import the training labels 
y_train <- read.table("~/Downloads/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")


features <- read.table("~/Downloads/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
names(X_test)<- features$V2
names(X_train)<- features$V2

#Combine the train data and store into "Train"
Train <- cbind(subject_train, y_train, X_train)

#combine the test data and store into "Test" 
Test <- cbind(subject_test, y_test, X_test)
#Rename the first column "Subject" and second column "Activity" in both the Test and
#Train datasets. 
names(Train)[1]<- "Subject"
names(Train)[2]<- "Activity"
names(Test)[1]<- "Subject"
names(Test)[2]<- "Activity"
#combine the Test and Train datasets into "Total" 
Total <- rbind(Test, Train)
#calculate the mean of each variable and store into "mean_total" 
mean_total <- sapply(Total[,3:563], mean)
#calculate the standard deviation of each variable store in "sd_total"
sd_total <- sapply(Total[,3:563], sd)
#create a new column "Act_Lab" to store the Activity labels based on the 
#string in "activity_labels"
Total$Act_Lab[Total$Activity == 1] <- "WALKING"
Total$Act_Lab[Total$Activity == 2] <- "WALKING=UPSTAIRS"
Total$Act_Lab[Total$Activity == 2] <- "WALKING_UPSTAIRS"
Total$Act_Lab[Total$Activity == 3] <- "WALKING_DOWNSTAIRS"
Total$Act_Lab[Total$Activity == 4] <- "SITTING"
Total$Act_Lab[Total$Activity == 5] <- "STANDING"
Total$Act_Lab[Total$Activity == 6] <- "LAYING"
write.table(Total, "Total.txt", row.name=FALSE) 


