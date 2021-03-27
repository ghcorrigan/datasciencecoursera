complete<- function(directory, id = 1:332){
   cdir<-getwd()
   if(dir.exists(directory)){ setwd(directory)}

  allDat<-data.frame(ids= seq_along(id),nobs = seq_along(id))
  for(ii in 1:length(id)){
    if(id[ii] %% 10 ==id[ii]){
      filename <- paste("00",id[ii],".csv",sep = "")
      } else if (id[ii] %% 100 == id[ii]){
        filename<- paste("0",id[ii],".csv",sep = "")
      } else {
        filename<- paste(id[ii],".csv",sep = "")
    }
    data <-read.csv(filename)
    sulf<- !is.na(data$sulfate)
    nit<- !is.na(data$nitrate)
    allDat[ii,]<- c(id[ii],sum(sulf & nit))
  }
  setwd(cdir)
  
  allDat
}
