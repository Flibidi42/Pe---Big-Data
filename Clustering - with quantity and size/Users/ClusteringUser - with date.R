User <- vector()

Hours <- matrix(ncol = 12, nrow = 0)
t <- as.POSIXlt(Sys.time())

nb_depot_min <- 20

Id <- character()

date_en_cours <- (t$year - 1) * 365 + t$yday

heure_en_cours <- floor(t$hour / 2)

User_en_cours <- vector()


tot_dep_date <-
  tot_dep[tot_dep$IdUserD != "AAAAAAAAAAA="  & tot_dep$IdUserD != "" & tot_dep$typeD %in% c(0,1,2,3,4,5),]
tot_dep_date <- tot_dep_date[order(as.POSIXlt(strptime(
  as.character(tot_dep_date[, "DateD"]), format = "%F %H:%M:%S"
))), ]


pb <- txtProgressBar(title = "progress bar",
                     min = 0,
                     max = nrow(tot_dep_date))



for (j in 1:nrow(tot_dep_date)) {
  if (j %% 1000 == 0) {
    setTxtProgressBar(pb, j)
  }
  Id <- as.character(tot_dep_date[j, "IdUserD"])
  
  t <-
    as.POSIXlt(strptime(as.character(tot_dep_date[j, "DateD"]), format = "%F %H:%M:%S"))
  
  if (is.na(t)) {
    next;
  }
  
  if (Id %in% User_en_cours &&
      ((t$year - 1) * 365 + t$yday) == date_en_cours
      && floor(t$hour / 2) == heure_en_cours) {
    next;
  }
  else if (((t$year - 1) * 365 + t$yday) != date_en_cours
           || floor(t$hour / 2) != heure_en_cours) {
    User_en_cours = vector()
    
  }
  else{
    User_en_cours = c(User_en_cours, Id)
    
  }
  
  date_en_cours = (t$year - 1) * 365 + t$yday
  
  heure_en_cours = floor(t$hour / 2)
  
  
  
  if (!(Id %in% User)) {
    User <- c(User, Id)
    
    Hours <- rbind(Hours, seq(0, 0, length.out = 12))
    
    date_used[[length(date_used) + 1]] <- vector()
    
  }
  
  Hours[which(User == Id), (t$hour / 2) + 1] <-
    Hours[which(User == Id), (t$hour / 2) + 1] + 1
  
  
}

to_remove <- vector();


for( i in 1:length(User)){
  if(nrow(tot_dep_date[as.character(tot_dep_date$IdUserD)==as.character(User[i]),]) < nb_depot_min)
    to_remove <- c(to_remove, i)
}
User <- User[-to_remove];
Hours <- Hours[-to_remove,];
Hours_pct <- Hours;

for (i in 1:nrow(Hours_pct)) {
  if (sum(Hours_pct[i,] != 0))
    Hours_pct[i, ] <- Hours_pct[i, ] * 100 / sum(Hours_pct[i, ])
  
}

Table_clust_user_date <- data.frame(User, Hours_pct)

Table_clust_user_date <-
  Table_clust_user_date[Table_clust_user_date[, 1] != "AAAAAAAAAAA=", ]

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


# rm(User, Hours, to_remove, tot_dep_date, date_en_cours, heure_en_cours, User_en_cours,
   # Hours_pct)

write.csv(file = "Clustering/Users/ClusteringUsersWithDate.csv", x = Table_clust_user_date)