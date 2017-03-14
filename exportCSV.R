for (i in 1:length(JDepot)){
  fileName<-paste('JdepotCSVwCont',i,'.csv',sep="")
  write.csv(file=fileName, x=JDepot[[i]])
}