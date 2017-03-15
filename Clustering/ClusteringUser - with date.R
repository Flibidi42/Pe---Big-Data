User <- vector()
date_used <- list()


Hours <- matrix(ncol = 12, nrow = 0)
t <- as.POSIXlt(Sys.time())

Id <- character()


for (j in 1:nrow(totaux_depots)) {
  
  if(j%%10000 == 0){
    print (paste("Avancement : ", as.character(round((j/nrow(totaux_depots))*100), 2), " %"));
  }
  Id <- as.character(totaux_depots[j, "IdUserD"])
  
  
  t <-
    as.POSIXlt(strptime(as.character(totaux_depots[j, "DateD"]), format = "%F %H:%M:%S"))
  
  
  
  if (!(Id %in% User)) {
    User <- c(User, Id)
    
    Hours <- rbind(Hours, seq(0, 0, length.out = 12))
    
    date_used[[length(date_used) + 1]] <- vector()
    
  }
  
  d <- date_used[[which(User == Id)]]
  
  
  if (Position(function(x)
    identical(x, c((t$year - 1) * 365 + t$yday, floor(t$hour / 2) + 1
    )),
    t, nomatch = 0) == 0) {
    Hours[which(User == Id), floor(t$hour / 2) + 1] <-
      Hours[which(User == Id), floor(t$hour / 2) + 1] + 1
    date_used[[which(User == Id)]] <-
      c(d,
        c((t$year - 1) * 365 + t$yday,
          floor(t$hour / 2)))
    
  }
  
  
}

User <- User[rowSums(Hours)>50];
Hours <- Hours[rowSums(Hours)>50,];

Hours_pct <- Hours;

for (i in 1:nrow(Hours_pct)) {
  if (sum(Hours_pct[i, ] != 0))
    Hours_pct[i,] <- Hours_pct[i,] * 100 / sum(Hours_pct[i,])
  
}

Table_clust_user_date <- data.frame(User, Hours_pct);
Table_clust_user_date <- Table_clust_user_date[Table_clust_user_date[,1]!="AAAAAAAAAAA=",]

colnames(Table_clust_user_date) <-
  c(
    "UserId",
    "0h-2h",
    "2h-4h",
    "4h-6h",
    "6h-8h",
    "8h-10h",
    "10h-12h",
    "12h-14h",
    "14h-16h",
    "16h-18h",
    "18h-20h",
    "20h-22h",
    "22h-0h"
  )

rm(User, Hours);
write.csv(file = "Clustering/ClusteringUsersWithDate.csv", x =Table_clust_user_date)