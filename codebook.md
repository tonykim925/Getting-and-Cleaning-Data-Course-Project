### CodeBook Information 

This codebook contains information regarding the Tidydata created from the run_analysis.R script. 

### Original Data Information

The description of the dataset can be found here: 
[Dataset Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original data that was used can be found here: 
[Original Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

*Please note that all of the files were downloaded as of 8/5/2020.* 

The original data named **"Human Activity Recognition Using Smartphones Dataset"** contains data from experiements carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the data captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Tidydata Variables: 

For each record it is provided:

subjectname =  An identifier of the subject who carried out the experiment. (1-30 )

activitylabels = Activity label with 6 possible values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Mean and standard deviation (std) of the following measurements: 
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

**Information regarding the variables above** 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


### Steps Taken To Transform Data (run_analysis.R)

1. Downloaded the raw files (x_test, label_test, sub_test, x_train, label_train, sub_train, variable_names, activity_labels)

2. merged the appropriate sets (x_total <- x_test with x_train, label_total <- label_test with label_train, and sub_ sub_test with sub_train) 

3. descriptive variable names were added to the merged x_test using the information from variable_names data table 

4. Numerical values of activities were substituted with descriptive values by merging label_total and activity_labels. The new file is set to label_total_renamed. 

5. the sub_total column name is renamed from V1 to subjectname 

6. sub_total, label_total_renamed, and x_total are combined together to form one data table named combined_data.

7. With the data has properly merged, mean and standard deviation for each measurement with the subjectname and activitylabels are extracted to form a new data table named mean_std_only. 

8. Using the mean_std_only data table, an independent tidy data with the average of each variable by activityname and subjectname is created. 






