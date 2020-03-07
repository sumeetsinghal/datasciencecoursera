findallpath is the method that travsere through all the directories and calls the processeachDir function.processeachDir function - Process each file in directory, merge each column and aggregate the data thru each file

step 1 -If two set of data has to be merged , process 1st set of data using method findallpath, pass path to the dataset and also pass the empty dataset.similar process the 2nd set of data.

step 2 - merge two set of data using rbind.

step 3 - process the merged data using group by function
