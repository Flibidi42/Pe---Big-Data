User <- vector();
Hours <- data.frame(matrix(ncol=12, nrow=0));
t <- as.POSIXlt(Sys.time());
Id <- character();

for(j in 1:length(JDepot)){
  for(i in j:nrow(JDepot[[j]])){
    Id <- as.character(JDepot[[j]][i,"IdUserD"]);
    if(Id %in% User){
      t <- as.POSIXlt(strptime(JDepot[[j]][i,"DateD"], format = "%FT%H:%M:%S"));
      Hours[which(Id == User), (t$hour /2) +1] <- Hours[which(Id == User), (t$hour /2) +1] + 1;
    }
    else{
      User <- c(User, Id);
      Hours <- rbind(Hours, seq(0,0,length.out = 12));
    }
  }
}

