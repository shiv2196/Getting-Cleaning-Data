# ************************************* README.md *************************************

## 1. The file was downloaded from the link and stored as 'Dataset.zip'

## 2. Further it was unzipped.

## 3. README.txt was read to go through the basic understading of the data provided.

## 4. Starting with 'train' folder, the text files were read into datasets namely: 

    (i) x_train dataset reads X_train.txt
    (ii) y_train dataset reads y_train.txt
    (iii) subject_train dataset reads subject_train.txt
    
## 5. Similarly 'test' folder was read into:
  
    (i) x_test dataset reads X_test.txt
    (ii) y_test dataset reads y_test.txt
    (iii) subject_test dataset reads subject_test.txt
    
## 6. Similarly:

    (i) features dataset reads features.txt
    (ii) activity dataset reads activity_labels.txt
    
## 7. Assigned the columns to all the datasets of 'train' and 'test'

    (i) x_train and x_test were assigned the second column of features dataset i.e. all the features
    (ii) y_train and y_test were assigned "ActivityID"
    (iii) subject_train and subject_test were assigned "SubjectID"
    
## 8. After assigning the column names, all the datasets of 'test' were merged by cbind() and similarly for 'train' datasets. 

    (i) TrainData dataset : Contains all the three datasets of 'train'
    (ii) TestData dataset : Contains all the three datasets of 'test'

## 9. A final one dataset 'CompleteData' was created by merging 'TrainData' and TestData' using rbind() 

## 10. A subset 'mean_std_measure' was created which contained all those measurements which had 'mean' and 'standard deviation'. grep() was used to extract only those measurements which had keyword 'mean' or 'std' in them.

## 11. To remove the confusion the selected measurements were given appropriate and descriptive activity names. The 'activity' dataset was merged with the 'mean_std_measure' dataset 'by' 'ActivityID' because this is a valid common column name in both the datasets.
    
## 12. Then, a second tidy dataset (SecTidySet) was created to calculate the average of each variable of each subject (SubjectID) and each activity (ActivityID). It was done by using 'aggregate()'

## 13. Finally a text file ???TidySet.txt' was created by using write.table() in which the 'SecTidySet' dataset was written.

###****************************************************************************************************
    
    