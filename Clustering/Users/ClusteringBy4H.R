Table_clust_user_4h <- Table_clust_user_date

#On regroupe les horaires
Table_clust_user_4h[, seq(2, 13, by = 2)] =
  Table_clust_user_date[, seq(2, 13, by = 2)] + Table_clust_user_date[, seq(2, 13, by =
                                                                              2) + 1]

Table_clust_user_4h = Table_clust_user_4h[,-seq(3, 13, by = 2)]

colnames(Table_clust_user_4h) <-
  c("UserId",
    "0h-4h",
    "4h-8h",
    "8h-12h",
    "12h-16h",
    "16h-20h",
    "20h-24h")
write.csv(Table_clust_user_4h, file = "Clustering/ClusteringUser4h.csv")
