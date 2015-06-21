
For this project we have used data collected from the accelerometers from the Samsung Galaxy S smartphone[1]. The goal of this project was to write an R script that would consolidate the training and test datasets and create a summary dataset with the average value for all variables of interest. 

Each record in the final dataset contains the following information:

* An identifier of the subject who carried out the experiment
* Activity label
* Average mean and standard deviation of 33 selected time and frequency domain variables for each activity and each subject


The r_analysis.R script creates the final dataset using the following steps:
* Imports test dataset files (subject_test.txt, X_test.txt, and y_test.txt) and training dataset files (subject_train.txt, X_train.txt, and y_train.txt) into R
* Merges the training and the test sets to create one dataset
* Extracts only the measurements on the mean and standard deviation for each measurement
* Imports features (features.txt) and activity (activity.txt) files
* Uses names in the activity file to name activities in the merged dataset
* Labels the dataset with descrpitive variable names from the features file
* Creates an independent tidy data set with the average of each variable for each activity and each subject

The CodeBook.md file describes the variables in the final dataset.


Reference:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
