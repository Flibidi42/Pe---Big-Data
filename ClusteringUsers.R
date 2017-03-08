User <- vector();
Hours <- data.frame(matrix(ncol=12, nrow=0));
colnames(Hours) <- c("0h-2h", "2h-4h", "4h-6h", "6h-8h", "8h-10h", "10h-12h", "12h-14h",
                     "14h-16h", "16h-18h", "18h-20h", "20h-22h", "22h-0h");
t <- as.POSIXlt(Sys.time());
Id <- character();

for(i in 1:nrow(JDepot)){
  Id <- as.character(JDepot[i,"IdUserD"]);
  if(Id %in% User){
    t <- as.POSIXlt(strptime(JDepot[i,"DateD"], format = "%FT%H:%M:%S"));
    Hours[which(Id == User), (t$hours /2) +1] <- Hours[which(Id == User), (t$hours /2) +1] + 1;
  }
  else{
    User <- c(User, Id);
    Hours <- rbind(Hours, seq(0,0,length.out = 12));
  }
}
