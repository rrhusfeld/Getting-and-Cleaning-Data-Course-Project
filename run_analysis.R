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

# Import the subject train vector subject_train
X_train <- read.table("~/Downloads/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
#Import the training labels 
y_train <- read.table("~/Downloads/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")


features <- read.table("~/Downloads/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
#convert names to all upper case to make sorting STD and MEAN easier with S/s and M/m
features$V2 <- toupper(features$V2)
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

# Make every event type uppercase
names(Total)<- toupper(names(Total))

# # Given the dataset (x values), extract only the measurements on the mean
# and standard deviation for each measurement.

# Find the mean and std columns
MEAN.COLUMN <- sapply(features[,2], function(x) grepl("MEAN()", x, fixed=T))
STD.COLUMN <- sapply(features[,2], function(x) grepl("STD()", x, fixed=T))

# Extract them from the data
Tidy <- Total[, (MEAN.COLUMN | STD.COLUMN)]
colnames(Tidy) <- features[(MEAN.COLUMN | STD.COLUMN), 2]

Tidy1 <- cbind(Total$SUBJECT, Total$ACTIVITY, Tidy)
names(Tidy1)[1]<- "SUBJECT"
names(Tidy1)[2]<- "ACTIVITY"


#create a new column "Act_Lab" to store the Activity labels based on the 
#string in "activity_labels"
Tidy1$Act_Lab[Tidy1$ACTIVITY == 1] <- "WALKING"
Tidy1$Act_Lab[Tidy1$ACTIVITY == 2] <- "WALKING=UPSTAIRS"
Tidy1$Act_Lab[Tidy1$ACTIVITY == 2] <- "WALKING_UPSTAIRS"
Tidy1$Act_Lab[Tidy1$ACTIVITY == 3] <- "WALKING_DOWNSTAIRS"
Tidy1$Act_Lab[Tidy1$ACTIVITY == 4] <- "SITTING"
Tidy1$Act_Lab[Tidy1$ACTIVITY == 5] <- "STANDING"
Tidy1$Act_Lab[Tidy1$ACTIVITY == 6] <- "LAYING"

#calculate the average of each column for each activity and subject using the plyr package. 
library(plyr)
Tidy2 <- ddply(Tidy1, .(SUBJECT, ACTIVITY), function(x) colMeans(x[,1:60]))

#write the table into 'TidyDataset.txt'
write.table(Tidy2, "TidyDataset.txt", row.name=FALSE) 


