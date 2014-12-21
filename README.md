# Get-Data Repository Overview
R program that processes sensor signal data from Samsung Galaxy S II smartphone.  Program reads test and training datasets and outputs a tidy dataset of the average of sensor data for each subject and activity.  


Source data:
==============
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Library(s): 
===========
plyr


R code:
===============
run_analysis.R


Program Step(s):
===============
1.  Imports activity and sensor name from Activity and Features files.  Features list is filtered for fields
    including: mean, Mean and std.  
 
2.  Imports tables from two UCI HAR Datasets: Train and Test.
	* x_train.txt: Sensor vector measurement data
	* y_train.txt: Activity list
	* subject_train.txt: Subject list
		
3.  x_train/x_test sensor vector measurements are subsetted to measurements of mean, Mean or std.  Subject and activity are binded to vector measurements.  Train and test datasets are combined to create dataset with 30 total subjects and 6 activities.  Mean of each vector measurement are calculated at the subject and activity level.  Tidy dataset with averages is written to SubjectActivityMeans.txt

Output File(s):
=================
SubjectActivityMeans.txt
