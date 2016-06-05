# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project
run_analysis will

1. Merges the training and test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average 
   of each variable for for each activity and each subject. 

The above tasks were completed by 

1. Importing the Test and Training data into R. Then assigning the features vector to the names of the Test and Train data sets. Once this was created. 

Renamed the first two columns to "Subject" and "Activity". "Activity" was used to reassign the names with "activity label" vector (i.e. WALKING, SITTING, ETC...) 

Used the rbind to combine the two data sets once they were labeled. Stored this into a Total dataset. 

Renamed the lables to all CAPS so we could filter the S/s and M/m in the Mean and Std labels. 

Then used the sapply command to extract the mean and standard deviation of the Total dataset, stored into Tidy dataset. 

Then used a rename feature to create a new column "Act_Lab" for activity labels from the "Activity" column. That is, 1 = "WALKING" 

Once in a Tidy1 dataset, used the colMeans function to calculate the average of each column for each activity and subject. 

Stored this dataset into Tidy2, then used 'write.table' to output the Total database to a text file called
"Total.txt" 


