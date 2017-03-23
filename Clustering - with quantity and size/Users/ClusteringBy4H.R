Table_clust_user_4h <- Table_clust_user_date

normaliser <- function(x){ ((x-mean(x))/(max(x) - min(x)))*100};

Table_clust_user_4h[, seq(2, 13, by = 2)] =
  Table_clust_user_date[, seq(2, 13, by = 2)] + Table_clust_user_date[, seq(2, 13, by =
                                                                              2) + 1]

Table_clust_user_4h = Table_clust_user_4h[,-seq(3, 13, by = 2)];

#Adding quantity and mean size
Qty = vector();
Size = vector();

pb <- txtProgressBar(title = "progress bar",
                     min = 0,
                     max = nrow(Table_clust_user_4h))

for(i in 1:nrow(Table_clust_user_4h)){
  if(i%%40 == 0)
    setTxtProgressBar(pb, i)
  t <- tot_dep_date[as.character(tot_dep_date$IdUserD) == as.character(Table_clust_user_4h[i,]$UserId),]
  Qty <- c(Qty, nrow(t));
  Size <- c(Size, mean(t$sizeD));
}
Table_clust_user_4h = cbind(Table_clust_user_4h, Qty, Size);
Table_clust_user_4h = Table_clust_user_4h[!is.na(Table_clust_user_4h$Size),]
# rm(Qty, Sizes, t);

colnames(Table_clust_user_4h) <-
  c("UserId",
    "0h-4h",
    "4h-8h",
    "8h-12h",
    "12h-16h",
    "16h-20h",
    "20h-24h",
    "Qty",
    "Size");
write.csv(Table_clust_user_4h, file = "Clustering/ClusteringUser4h.csv")
