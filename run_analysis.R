library(dplyr)

setwd("C:/Dokumentumok/Data Science/")
data_path <- "UCI HAR Dataset"

############################## 
# 1: Loads and Merges the training and the test sets to create one data set.
# Loads the training and test datasets.

# Mérési adatok - X data
X_train <- read.table(file.path(data_path, "train", "X_train.txt"))
X_test <- read.table(file.path(data_path, "test", "X_test.txt"))

# Címkék (activity) - activity data
y_train <- read.table(file.path(data_path, "train", "y_train.txt"))
y_test <- read.table(file.path(data_path, "test", "y_test.txt"))


# Alanyok (subject)
subject_train <- read.table(file.path(data_path, "train", "subject_train.txt"))
subject_test  <- read.table(file.path(data_path, "test", "subject_test.txt"))

# Feature names
features <- read.table(file.path(data_path, "features.txt"), stringsAsFactors = FALSE)
feature_names <- features$V2  # A második oszlop tartalmazza a mérési változó neveket

######################################################
# Merges the training and the test sets into one dataset.

# Merge X: Mérési adatok összefűzése
X_total <- rbind(X_train, X_test)

# Merge Y: Címkék összefűzése
y_total <- rbind(y_train, y_test)

# Merge subjects: Alanyok összefűzése
subject_total <- rbind(subject_train, subject_test)


# Merge all data
complete_data <- cbind(subject_total, y_total, X_total)

# Giving names
colnames(complete_data)[1:2] <- c("subject", "activity")
colnames(complete_data)[3:ncol(complete_data)] <- feature_names  # Mérési változók nevei

#####################################################
# 2: Extracts only the measurements on the mean() and standard deviation (std).

# New dataframe with mean() and std() columns, + subject and activity

mean_std_data <- complete_data %>%
  select(
    subject,
    activity,
    contains("mean()"),
    contains("std()")
  )


#######################################################
# 3: Uses descriptive activity names to name the activities in the data set

# Reading activity labels
activity_labels <- read.table(file.path(data_path, "activity_labels.txt"), stringsAsFactors = FALSE)
colnames(activity_labels) <- c("activity_id", "activity_name")

head(activity_labels)

mean_std_data <- mean_std_data %>%
  left_join(activity_labels, by = c("activity" = "activity_id")) %>%
  select(subject, activity_name, everything())   # set activity_name to column2

#########################################################
# 4: Labels the dataset with descriptive variable names.

library(stringr)

names(mean_std_data) <- names(mean_std_data) %>%
  str_replace_all("^t", "Time") %>%
  str_replace_all("^f", "Frequency") %>%
  str_replace_all("Acc", "Accelerometer") %>%
  str_replace_all("Gyro", "Gyroscope") %>%
  str_replace_all("Mag", "Magnitude") %>%
  str_replace_all("BodyBody", "Body") %>%
  str_replace_all("-mean\\(\\)", "Mean") %>%
  str_replace_all("-std\\(\\)", "Std") %>%
  str_replace_all("-X", "X") %>%
  str_replace_all("-Y", "Y") %>%
  str_replace_all("-Z", "Z")

#########################################################
# 5:Creates a second tidy dataset with the average of each variable for each activity and each subject.

tidy_data <- mean_std_data %>%
  group_by(subject, activity, activity_name) %>%  
  summarise(across(everything(), mean),.groups = "drop")


#  Writes the tidy dataset to a file called tidy_data.txt.

write.table(
  tidy_data,
  file = file.path(data_path, "tidy_data.txt"),
  row.names = FALSE
)
