User <- vector();
Hours <- data.frame(matrix(ncol=12, nrow=0));
t <- as.POSIXlt(Sys.time());
Id <- character();

for(i in 1:nrow(JDepot)){
  Id <- as.character(JDepot[i,"IdUserD"]);
  if(Id %in% User){
    t <- as.POSIXlt(strptime(JDepot[i,"DateD"], format = "%FT%H:%M:%S"));
    Hours[which(Id == User), (t$hour /2) +1] <- Hours[which(Id == User), (t$hour /2) +1] + 1;
  }
  else{
    User <- c(User, Id);
    Hours <- rbind(Hours, seq(0,0,length.out = 12));
  }
}
