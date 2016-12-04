# datasciencecoursera
coursera data science

## Getting and Cleaning Data Course Project

In this repo you will find the following:<br />
<b>README.md</b> -- This file.<br />
<b>CodeBook.pdf</b> -- A code book describing the data contained in the Tiny Data Set produced by run_analysis.R<br />
<b>run_analysis.R</b>  -- The run_analysis.R file is a script created to produce a tidy data set based on the Human Activity Recognition Using Smartphones Data Set[1].<br /> 

###run_analysis.R
Step 1. Initial action is to load useful library dplyr.<br />
Step 2. Verify that the /data directory exists under default workspace, if not the script will create data directory under default workspace.<br />
Step 3. Verify if UCI HAR Dataset.zip exists in ./data directory, if not the script will download file.<br />   
Step 4. Extract UCI HAR Dataset.zip file to "/data/UCI HAR Dataset" directory, if directory "/data/UCI HAR Dataset" directory is not already present.<br />
Step 5. Read features.txt into data frame to later populate test and train measurement column headers.<br />
Step 6. Read activity_labels.txt into data frame to later populate test and train activity labels.<br />
Step 7. Prepare train data set. Read column of Subjects into data frame.<br />
Step 8. Add "subject" as column name.<br />
Step 9. Read Training labels into data frame.<br />
Step 10. Add "activity" to train label column name.<br /> 
Step 11. Read train measurements set into data frame.<br /> 
Step 12. Add column names from features, as required in Assignment step 4.<br /> 
Step 13. Combine train activities to measurements and combine with subjects.<br />  
Step 14. Prepare test data set. Read column of Subjects into data frame.<br />
Step 15. Add "subject" as column name.<br />
Step 16. Read test labels into data frame.<br />
Step 17. Add "activity" to Training label column name.<br /> 
Step 18. Read test measurements set into data frame.<br /> 
Step 19. Add column names from features, as required in Assignment step 4.<br /> 
Step 20. Combine test activities to measurements and combine with subjects.<br />  
Step 21. Assignment step 1. - Merge both Training and test data sets.<br />
Step 22. Assignment step 2. - Extract only the measurements on the mean and standard deviation for each measurement.<br /> 
Step 22a. Find and return columns meeting regular expression for mean and standard deviation.<br />
Step 22b. Filter out meanFreq as it is a frequency of means and not the mean or average of anything.<br />
Step 23. Assignment step 3. - Uses descriptive activity names to name the activities in the data set
Step 24. Assignment step 4. - Appropriately labels the data set with descriptive variable names.<br /> 
        (This step was previously carried out as last step in preparation of train and test data sets (see code line numbers 23-24 and 42-43)).<br />
Step 25. Assignment step 5. - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br />
Step 26. Rename the measurement columns to "Means_of_".<br />
Step 27. Write independent_tidy_data_set to tidy_data_set.txt file in "./data/UCI HAR Dataset" directory.<br />
Step 28. View(independent_tidy_data_set).<br />

[1]The source data for this project is produced by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012. 