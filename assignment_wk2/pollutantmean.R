pollutantmean <-function(directory,pollutant, id = 1:332){
  cdir<-getwd()
  if(dir.exists(directory)){ setwd(directory)}
    
  allDat<-NA
  for(ii in 1:length(id)){
    if(id[ii] %% 10 ==id[ii]){
      filename <- paste("00",id[ii],".csv",sep = "")
      } else if (id[ii] %% 100 == id[ii]){
        filename<- paste("0",id[ii],".csv",sep = "")
      } else {
        filename<- paste(id[ii],".csv",sep = "")
    }
    data <-read.csv(filename)
    goodCol <-colnames(data)==pollutant
    goodDat <-data[,goodCol]
    allDat <- c(allDat,goodDat)
    
    
  }
  setwd(cdir)
  mean(allDat,na.rm =TRUE)
}