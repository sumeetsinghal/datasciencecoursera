Description of all variables used in program

activity - variable that holds the activity
features - variable that holds the features
data_file1 - holding the x axis test data
data_file2 - holding the y axis test data
data_file3 - holds subject test data
data_file4 - merged data from test files 
data_file5 - holding the x axis test data
data_file6 - holding the y axis test data
data_file7 - holds subject test data
data_file8 - merged data from test files 
data_file9 - merged data of test and train files
data_file10 - data with the header names and filtered by mean and Standard deviation
aggdata - aggregated data by average

Here are the list of process that was applied:

- load the features from the features file  

make sure file is placed as per the code in right place, add it to dataframe variable features
- load the activity from the features file  
add it to dataframe variable activity
- load the test data  from the specified folder. Load the X, Y and Subject data and merge column wise.
- load and aggregate the test data from three data frame
data_file4 has the final aggregated test data
- load the train data  .Load the X, Y and Subject data and merge column wise.
- dd the features name to the dataset
- load and aggregate the training data from three data frame
data_file8 has the final aggregated training data

- aggregate the test and train data
  data_file9 <-  rbind(data_file4,data_file8) ,,,,code to merge the test and training data

-filter only the mean and Standard devition data 
data_file10 has the final aggregated training data with right parameter names 

- add activity names replacing with activity code                     
- group by activity and subject                     
- write to file                     
  
  
