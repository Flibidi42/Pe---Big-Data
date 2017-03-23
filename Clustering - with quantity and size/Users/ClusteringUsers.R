User <- vector()

Hours <- matrix(ncol = 12, nrow = 0)

t <- as.POSIXlt(Sys.time())

nb_depot_min <- 20

Id <- character()
pb <- txtProgressBar(title = "progress bar",
                     min = 0,
                     max = nrow(tot_dep))


for (j in 1:nrow(tot_dep)) {
  Id <- as.character(tot_dep[j, "IdUserD"])
  
  if (j %% 1000 == 0) {
    setTxtProgressBar(pb, j)
  }
  
  if (!(Id %in% User)) {
    User <- c(User, Id)
    
    Hours <- rbind(Hours, seq(0, 0, length.out = 12))
  }
  t <-
    as.POSIXlt(strptime(as.character(tot_dep[j, "DateD"]), format = "%F %H:%M:%S"))
  
  Hours[which(User == Id), (t$hour / 2) + 1] <-
    Hours[which(User == Id), (t$hour / 2) + 1] + 1
  
}

Hours_pct <- Hours


for (i in 1:nrow(Hours_pct)) {
  if (sum(Hours_pct[i, ] != 0))
    Hours_pct[i,] <- Hours_pct[i,] * 100 / sum(Hours_pct[i,])
  
}

Table_clust_user <- data.frame(User, Hours_pct)

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


write.csv(Table_clust_user, file = "Clustering/ClusteringUsers.csv")

Hours_pct <- Hours[rowSums(Hours) >= nb_depot_min, ]

User <- User[rowSums(Hours) >= nb_depot_min]


for (i in 1:nrow(Hours_pct)) {
  if (sum(Hours_pct[i, ] != 0))
    Hours_pct[i,] <- Hours_pct[i,] * 100 / sum(Hours_pct[i,])
  
}

Table_clust_user_plus_100 <- data.frame(User, Hours_pct)

colnames(Table_clust_user_plus_100) <-
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

write.csv(Table_clust_user_plus_100, file = "Clustering/ClusteringUsers+100.csv")