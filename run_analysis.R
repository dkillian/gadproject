# Merges the training and the test sets to create one data set.


x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

## Creating the "X"  dataset
x_data <- rbind(x_train, x_test)

## Creating the "Y"  dataset

y_data <- rbind(y_train, y_test)

## Creating "subject" data set
subject_data <- rbind(subject_train, subject_test)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")

mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_std_features]

# Assigning names to the columns
names(x_data) <- features[mean_std_features, 2]


# Naming the activities in the dataset with descriptive labels
activit <- read.table("activity_labels.txt")

y_data[, 1] <- activit[y_data[, 1], 2]

names(y_data) <- "activity"
#Labelling the dataset with descriptive variable names. 

# Setting column name
names(subject_data) <- "subject"

# Combining all the datasets in a single one
mergedData <- cbind(x_data, y_data, subject_data)



#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avrData <- ddply(mergedData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avrData, "avrData.txt", row.name=FALSE)