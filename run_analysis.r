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
    aggdataf 
  
  
  




