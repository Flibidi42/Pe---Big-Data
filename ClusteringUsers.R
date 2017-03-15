User <- vector()

Hours <- matrix(ncol = 12, nrow = 0)

t <- as.POSIXlt(Sys.time())

Id <- character()


for (j in 1:nrow(totaux_depots)) {
  Id <- as.character(totaux_depots[j, "IdUserD"])
  
  if (!(Id %in% User)) {
    User <- c(User, Id)
    
    Hours <- rbind(Hours, seq(0, 0, length.out = 12))
  }
    t <-
      as.POSIXlt(strptime(as.character(totaux_depots[j, "DateD"]), format = "%F %H:%M:%S"))
    
    Hours[which(User == Id), (t$hour / 2) + 1] <-
      Hours[which(User == Id), (t$hour / 2) + 1] + 1
    
}

for (i in 1:nrow(Hours)) {
  if(sum(Hours[i,] != 0))
  Hours[i, ] <- Hours[i, ] * 100 / sum(Hours[i, ])
  
}

Table_clust_user <- data.frame(User, Hours)

colnames(Table_clust_user) <-
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

rm(User, Hours)

write.csv(Table_clust_user, file = "Table_user.csv")

hc_fit <- hclust(dist(Table_clust_user[,2:13]), method="ave");

Table_clust_user_plus_100 <- Table_clust_user;
for(i in 1:nrow(Table_clust_user)){
  if(sum(Table_clust_user[i,2:13]) < 100){
    Table_clust_user_plus_100 <- Table_clust_user_plus_100[-i,];
  }
}

write.csv(Table_clust_user_plus_100, file = "Table_user2.csv")
