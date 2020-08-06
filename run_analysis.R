#packages used 
library(dplyr)

# Getting the Data from online 
url <- "https://d396qusza40orc.cloudfront.net/
getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url, destfile = "./finalprojectdata/accelerometers.zip")
unzip("accelerometers.zip")

setwd("./finalprojetdata/UCI HAR Dataset")

# Getting test data 
x_test <- read.table("./test/X_test.txt") #str of 2947 obs of 561 variables
label_test <- read.table("./test/Y_test.txt") #str of 2947 obs of 1 variable 
sub_test <- read.table("./test/subject_test.txt") #str of 2947 obs of 1 variable

# Getting train data
x_train <- read.table("./train/X_train.txt") #str of 7352 obs of 561 variables
label_train <- read.table("./train/Y_train.txt") #str of 7352 obs of 1 variable 
sub_train <- read.table("./train/subject_train.txt") #str of 7352 obs of 1 variable

# Getting features(variable names) and activity labels 
variable_names <- read.table("./features.txt") 
activity_labels <- read.table("./activity_labels.txt") 

# Combining test and train datasets
x_total <- rbind(x_test, x_train)
label_total <- rbind(label_test, label_train)
sub_total <- rbind(sub_test, sub_train)

# Setting column names with correct variable names  
colnames(x_total) <- variable_names[,2]

# Setting up label dataset by substituting numerical values with activity labels
label_total_renamed <- merge(label_total, activity_labels, by.x = "V1", 
                             by.y = "V1", sort = FALSE)
label_total_renamed <- rename(label_total_renamed, activitylabels = V2)[2]

#Setting appropriate column name to sub_total
sub_total <- rename(sub_total, subjectname = V1)

#combining main data set, subject name, and activity names
combined_data <- cbind(sub_total, label_total_renamed, x_total)
View(combined_data)

# Data has now been properly merged, descriptive activity names have been set 
# and appropriate labels have been established. Now I will extract the measurements 
# of mean and standard deviation for each measurement 

columns <- colnames(combined_data)
column_selected <- (grepl("subjectname", columns) | grepl("activitylabels", columns) |
                    grepl("mean", columns) | grepl("std", columns) )
mean_std_only <- combined_data[,column_selected]

# Creating a second, independent tidy data set with average of each variable by
# activity and each subject

tidydata <- aggregate(.~subjectname + activitylabels, data = mean_std_only, mean)
tidydata <- arrange(tidydata, subjectname, activitylabels)

#saving the tidydata for github 
write.table(tidydata, file = "tidydata.txt", row.name = F )









