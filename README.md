Get-Data
========

Repository Description: 
R program that processes sensor signal data from Samsung Galaxy S II smartphone.  Program reads test and training datasets and outputs a tidy dataset of the average of sensor data for each subject and activity.  


Source data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Library: 
plyr


R code:
run_analysis.R

Program Steps:
1.  Imports activity and sensor name from Activity and Features files.  Features list is filtered for fields
    including: mean, Mean and std.  
 
2.  Imports tables from two UCI HAR Datasets: Train and Test.   Example file content imported:
	x_train.txt: Sensor data
	y_train.txt: Activity list
	subject_train.txt: Subject list
		
3.  x_<test/train> is subsetted only to fields with mean, Mean or std.  Subject and Activity appended to datasets.  
    Train and test data are combined and averages created for subject and activity which is outputted to SubjectActivityMeans.txt