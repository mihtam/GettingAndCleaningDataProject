## Raw data set description

The source of the raw data set is Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
	
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'.

## Tidy data set description

The tidy data set contains the average of the mean and standard deviation measurements grouped by subject and activity. 

Column SubjectId has values in the interval 1 to 30 corresponding to the 30 subjects used in the experiments.
Column Activity refers to the studied activities on the subjects: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
The remaining columns are numeric columns refering to the average of the mean and standard deviation measurements taken, gouped by subject and activity. The meaning of each variable is described in the "Raw Data Set Description".

The data set has a for each combination of (SubjectId, Activity) : 30 subjects x 6 activities = 180 rows

### It complyes to the rules of tidy data set because:

1. Each column corresponds to a specific measurement (mean and standard deviation measurements) of a subject in a specific activity. Subject and activity are identified accordingly by a column each: SubjectId and Activity.
2. Each row corresponds to a specific subject activity. 
3. Data contained in the table refers only to the measurements taken by a wearable computer (Samsung smartphone) on a number of subjects.
4. References to subjects are included for links to more possible information about subjects: SubjectId. 
 
## Raw data transformation to tidy data set 

The tidy data set is generated from the raw data set found under "UCI HAR Dataset" directory by the run_analysis.R script. The result can be found in avg_act_sub.txt. 

### Steps:

1. A partial data set test_data_1 is built from test data: subject_test, y_test, X_test. The 3 data set are merged with cbind() function. They all have the same number of observation and correspond to the subjects beeing tested, activities performed by the subjects and th2 actual corresponding measurements.

2. A second partial data set train_data_1 is build similarly from subject_train, y_train and X_train from the same considerations.

3. A complete data set is built from the 2 partial test and train data sets with rbind() function.

4. The new data set gets its variable names from features.txt plus "SubjectId" and "ActivityId" for the 2 new added columns. 

5. Regular expression "[M|m]ean|[S|s]td|SubjectId|ActivityId" is used to create a narrow data set with the specified columns: the measurements on the mean and standard deviation.

6. Activity_labels.txt is used to name the activities in the data set with descriptive activity names.  

7. The variable labels are cleaned of parenthesys and commas and gived more meaningfull names:

"^t" <- "TimeDomain."
"^f" <- "FrequencyDomain."
"Acc" <- "Acceleration"
"Gyro" <- "AngularVelocity"

8. Function ddply() from 'plyr' library is used to create the tidy data set with the average of each variable for each activity and each subject.


9. Finally the tidy data set in written on the disk wit write.table() as "avg_act_sub.txt".




