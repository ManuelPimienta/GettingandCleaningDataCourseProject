# Code book
This page describes the variables and data analyzed, as well as the changes that were made to them in order to create a tidy dataframe.

The data analyzed are the records of activities carried out by people who had a Samsung Galaxy S II smartphone through different sensors. The data obtained from these measurements is divided into two data sets, one for training and the other for testing. The idea of this analysis is to join all the data in a single frame to be able to analyze them and present at the end a data frame summarizing the means and standard deviation of the measured variables.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

After creating and joining the data frames of the measurements recorded by the cell phone, we start with a data frame containing 10,299 entries, 563 total columns.

After renaming the general data frame columns, a separate data frame is extracted that contains the mean and standard deviation of each data or activity mediated by the sensors.

After renaming the general data frame columns, a separate data frame is extracted that contains the mean and standard deviation of each data or activity mediated by the sensors. This data frame contains 10,299 entries and 88 columns in total. On this resulting data frame, column names are cleaned up, removing signs such as - or (), and lowering all letters and creating more descriptive variable names.

Finally, a summary of the data is created by taking the mean of the measurements from the resulting data frame.
