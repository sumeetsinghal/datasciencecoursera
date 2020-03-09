install.packages("dplyr")
library(dplyr)
  
# load the features from the features file  
  
  path <- "/Users/sumeetsinghal/sumeet/Coursera/datacleaningweek4/UCIHARDataset"
  setwd(path)
  features <- read.table("features.txt", header = F, stringsAsFactors=F)

# load the activity from the features file  

  activity <- read.table("activity_labels.txt", header = F, stringsAsFactors=F)
  activity[3,2]
# load the test data  
  path <- "/Users/sumeetsinghal/sumeet/Coursera/datacleaningweek4/UCIHARDataset/test"
  setwd(path)
  data_file1 <- read.table("X_test.txt", header = F, stringsAsFactors=F)

# load and aggregate the test data from three data frame
  names(data_file1) <- features[[2]]
  data_file2 <- read.table("y_test.txt", header = F, stringsAsFactors=F ,col.names = "Activity")
  data_file3 <- read.table("subject_test.txt", header = F, stringsAsFactors=F ,col.names = "Subject")
  data_file4 <- cbind(data_file3,data_file2,data_file1) 

  # load the train data  

  getwd()
  path <- "/Users/sumeetsinghal/sumeet/Coursera/datacleaningweek4/UCIHARDataset/train"
  setwd(path)


  data_file5 <- read.table("X_train.txt", header = F, stringsAsFactors=F)

# add the features name to the dataset
  names(data_file5) <- features[[2]]

# load and aggregate the training data from three data frame

  data_file6 <- read.table("y_train.txt", header = F, stringsAsFactors=F ,,col.names = "Activity")
  data_file7 <- read.table("subject_train.txt", header = F, stringsAsFactors=F,col.names = "Subject")
  data_file8 <- cbind(data_file7,data_file6,data_file5) 
  
  #aggregate the test and train data
  data_file9 <-  rbind(data_file4,data_file8)
  
# filter only the mean and Standard devition data
  featuresfilter <- grep("*mean()|std()[-]*" , features[[2]])
  features[[2]][featuresfilter]
  data_file10 <- data_file9[, c("Subject","Activity", features[[2]][featuresfilter])]
  newlabel <-  lapply(data_file10[, "Activity"], replace <- function(x) activity[x,2])
                      
 # add activity names replacing with activity code                     
  data_file10[, "Activity"] <- newlabel
  data_file10
  
 # group by activity and subject                     
  aggdata <- data_file10 %>% group_by(Subject, Activity)
  aggdata
 
 #write to file                     
  path <- "/Users/sumeetsinghal/sumeet/Coursera/datacleaningweek4/UCIHARDataset"
  setwd(path)
  write.table(aggdata, file = "data")
  
  
  
  
