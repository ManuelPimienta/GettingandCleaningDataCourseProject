# Code book
This page describes the variables and data analyzed, as well as the changes that were made to them in order to create a tidy dataframe.

The data analyzed are the records of activities carried out by people who had a Samsung Galaxy S II smartphone through different sensors. The data obtained from these measurements is divided into two data sets, one for training and the other for testing. The idea of this analysis is to join all the data in a single frame to be able to analyze them and present at the end a data frame summarizing the means and standard deviation of the measured variables.

After creating and joining the data frames of the measurements recorded by the cell phone, we start with a data frame containing 10,299 entries, 563 total columns.

After renaming the general data frame columns, a separate data frame is extracted that contains the mean and standard deviation of each data or activity mediated by the sensors.

After renaming the general data frame columns, a separate data frame is extracted that contains the mean and standard deviation of each data or activity mediated by the sensors. This data frame contains 10,299 entries and 88 columns in total. On this resulting data frame, column names are cleaned up, removing signs such as - or (), and lowering all letters and creating more descriptive variable names.

Finally, a summary of the data is created by taking the mean of the measurements from the resulting data frame.
