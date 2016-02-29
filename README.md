# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project
#run_analysis will
#1. Merges the training and test sets to create one data set
#2. Extracts only the measurements on the mean and standard deviation for each measurement
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for for each activity and each subject. 

The above tasks were completed by 
1. Importing the Test and Training data into R. Then assigning the features vector to the names of the Test and Train data sets. Once this was created. 

Renamed the first two columns to "Subject" and "Activity". "Activity" was used to reassign the names with "activity label" vector (i.e. WALKING, SITTING, ETC...) 

Used the rbind to combine the two data sets once they were labeled. Stored this into a Total dataset. 

Then used the sapply command to calculate the mean and standard deviation of the Total dataset. 

Then used a rename feature to create a new column "Act_Lab" for activity labels from the "Activity" column. That is, 1 = "WALKING" 

After these items 1-4 were completed as laid out above, then used 'write.table' to output the Total database to a text file called
"Total.txt" 


