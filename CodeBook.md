CodeBook

1.The features selected for this dataset are sourced from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
2. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
3. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
4. In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Estimate Variables Extracted:
tBodyAcc-XYZ , tGravityAcc-XYZ , tBodyAccJerk-XYZ, tBodyGyro-XYZ , tBodyGyroJerk-XYZ, tBodyAccMag , tGravityAccMag , tBodyAccJerkMag
tBodyGyroMag ,tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag , fBodyGyroMag
fBodyGyroJerkMag

From these variables only mean and standard deviation measures are retained which include the following:
gravityMean , tBodyAccMean , tBodyAccJerkMean ,tBodyGyroMean , tBodyGyroJerkMean

The resulting variable names are of the following form: tbodyaccmeanx, which means the mean value of tBodyAcc-XYZ.