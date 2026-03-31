# Code Book

## Data description
The data come from the Human Activity Recognition Using Smartphones Dataset. The dataset contains measurements collected from accelerometers and gyroscopes of smartphones.

## Variables

### Identifiers
- subject – ID of the subject (1–30)
- activity – Type of activity performed

### Activities
The activities included in the dataset are:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### Measurements
The dataset contains the average of the following measurements for each subject and activity:
- TimeBodyAccelerometerMeanX
- TimeBodyAccelerometerMeanY
- TimeBodyAccelerometerMeanZ
- TimeBodyAccelerometerStdX
- TimeBodyAccelerometerStdY
- TimeBodyAccelerometerStdZ
- TimeBodyGyroscopeMeanX
- TimeBodyGyroscopeMeanY
- TimeBodyGyroscopeMeanZ
- TimeBodyGyroscopeStdX
- TimeBodyGyroscopeStdY
- TimeBodyGyroscopeStdZ
- FrequencyBodyAccelerometerMeanX
- FrequencyBodyAccelerometerMeanY
- FrequencyBodyAccelerometerMeanZ
- FrequencyBodyAccelerometerStdX
- FrequencyBodyAccelerometerStdY
- FrequencyBodyAccelerometerStdZ

## Transformations performed
The following transformations were performed on the data:
1. Merged the training and test datasets.
2. Extracted only mean and standard deviation measurements.
3. Replaced activity IDs with descriptive activity names.
4. Renamed variables to descriptive names.
5. Created a tidy dataset with the average of each variable for each subject and activity.