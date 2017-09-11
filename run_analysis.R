#********************** Getting and Cleaning Data **********************
#********************** Course Project - Assignment ********************


# Download the zip file from the link provided
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Dataset.zip")
# Unzip the 'Dataset.zip' to desired location
unzip(zipfile="./Dataset.zip",exdir="./Dataset")

# Reading from 'train' folder
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Reading from 'test' folder
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# Reading 'feature.txt' and 'activity_label.txt'
features <- read.table("./features.txt")
activity <- read.table("./activity_labels.txt")

# Assigning column names to 'train' data tables
colnames(x_train) <- features[,2] # second column in 'features.txt' consists of names
colnames(y_train) <- "ActivityID"
colnames(subject_train) <- "SubjectID"

# Assigning column names to 'test' data tables
colnames(x_test) <- features[,2] # second column in 'features.txt' consists of names
colnames(y_test) <- "ActivityID"
colnames(subject_test) <- "SubjectID"

# Assigning column names to 'acitivity'
colnames(activity) <- c("ActivityID","Activity_Type") # Will be used later in Problem.3

# ******** Problem 1. Merging both the data sets ********
TrainData <- cbind(subject_train,y_train,x_train)
TestData <- cbind(subject_test,y_test,x_test)
CompleteData <- rbind(TrainData,TestData) # Column names of both the datasets are same


# ******** Problem 2. Extracting only 'mean' and 'standard deviation' measurements ********
AllColNames <- colnames(CompleteData) # So as to have all the column names in one variable
Mean_Std_Only <- grep("SubjectID|ActivityID|mean|std", AllColNames) # Selecting only these 04 column names
mean_std_measure <- CompleteData[,Mean_Std_Only] # New data set which has only these 04 columns


# ******** Problem 3. To use descriptive activity names to name the activities in the data set ********
DescriptiveNames <- merge(mean_std_measure,activity,by="ActivityID") # Merging to give descriptive names to activities


# ******** Problem 4. To appropriately label the data set with descriptive variable names.
head(DescriptiveNames) # The columns of dataset are well descriptive 


# ******** Problem.5 To create a second independent tidy data set with ********
# ******** the average of each variable for each activity and each subject.********
SecTidySet <- aggregate(. ~SubjectID + ActivityID, DescriptiveNames, mean) # Asecond tidy dataset is created
# The average of all the column names are calculated for each 'SubjectID' and 'ActivityID'
head(SecTidySet)

# Writing the Second tidy dataset into a '.txt' file
write.table(SecTidySet, "TidySet.txt", row.name=FALSE)







  
  
  
  