library(dplyr)

#rename the file as per feature
getname <- function(x) {

  name <- unlist(strsplit(x, "_"))
  y<- length(name)
  newname <- ""
  i=1
  while(i <y) {
    if(i+1 ==y) newname <- paste0(newname, name[i])
    else newname <- paste0(newname, name[i],"_")
    i=i+1
   }
   newname 
  
  }


# Process each file in directory, merge each column and aggregate the data thru each file
processeachDir <- function(path, fileName, aggdataf) {
  data_file <- read.table(file=paste0(path,"/", filename),header = F, stringsAsFactors=F)
  length <- nrow(data_file)
  newdataf <- data.frame()
  i=1
  while(i <= length) {
    meanv <- mean(c(unlist(data_file[i,])), na.rm= TRUE)
    sdv <- sd(c(unlist(data_file[i,])), na.rm= TRUE)
    if(!is.na(sdv)) 
      newdataf[i,paste0("SD_",getname(fileName))] <- sdv
      
    i <i + 1
  }
  
  
  newdataf
  if(nrow(aggdataf) ==0) {
    aggdataf <- newdataf
  else   
      aggdataf <- cbind(aggdataf, newdataf)
   aggdataf
    
}

# traverse through all the directory and process each file
  findallpath <- function(path, aggdataf1) {
    fs <- list.file(path)
    for(fileName in fs) {
      if(dir.exists(fileName))
        aggdataf1 <- findallpath(paste0(path,"/",fileName), aggdataf1)
      else   
         aggdataf1 <- processeachDir(path,fileName,aggdataf1)
         aggdataf1
    }
       aggdataf1
   }

  
  # this is execution of the main code
  
  #aggregate the training data
  setwd("c:/workarea/train")
  path <- "c:/workarea/train"
  aggdataf2 <- data.frame()
  aggdataf1 <- data.frame()
  aggdataf1 <- findallpath(path,aggdataf2)
  
  #aggregate the test data
  setwd("c:/workarea/test")
  path <- "c:/workarea/test"
  aggdataf3 <- data.frame()
  aggdataf4 <- data.frame()
  aggdataf3 <- findallpath(path,aggdataf4)
    
  #Merging both data
  aggdataf5 <- data.frame()
  aggdataf5 <- rbind(aggdataf1,aggdataf3)
  aggdataf5
  
  # aggregate group by the subject
  aggdata <- aggdataf5 %>% group_by(mean_subject)




