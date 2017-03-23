Table_to_clust <- Table_clust_user_4h;
Table_to_clust$Size <- normaliser(Table_to_clust$Size);
Table_to_clust$Qty <- normaliser(Table_to_clust$Qty);

#Clustering User Date
k_fit <- kmeans(Table_to_clust[, 2:ncol(Table_to_clust)], 2)

Table_clustered2 <-
  data.frame(Table_to_clust$UserId, k_fit$cluster)

m <- as.matrix(k_fit$centers)

plot(
  k_fit$centers[1, 2:(ncol(Table_to_clust)-2)],
  col = "red",
  type = "o",
  ylab = "% de dépots",
  xlab = "Horaires",
  main = "Centers of Clustering (K = 2)",
  ylim = c(0,80)
)

points(m[2, 2:(ncol(Table_to_clust)-2)], col = "green", type = "o")

legend("topright", legend=c("Cluster 1", "Cluster 2"),
       col=c("red", "green"), lty=1:2, cex=0.8, bg="transparent")

print("Clustering a 2 cluster:")

for (i in 1:2) {
  print(paste(
    "Groupe ",
    i ,
    " : ",
    sum(Table_clustered2 == i) / nrow(Table_clustered2) * 100,
    " %"
  ))
  
}

k_fit <- kmeans(Table_to_clust[, 2:ncol(Table_to_clust)], 3)

Table_clustered3 <-
  data.frame(Table_to_clust$UserId, k_fit$cluster)

m <- as.matrix(k_fit$centers)

plot(
  k_fit$centers[1, 2:(ncol(Table_to_clust)-2)],
  col = "red",
  type = "o",
  ylab = "% de dépots",
  xlab = "Horaires",
  main = "Centers of Clustering (K = 3)",
  ylim = c(0,80)
)

points(m[2, 2:(ncol(Table_to_clust)-2)], col = "green", type = "o")

points(m[3, 2:(ncol(Table_to_clust)-2)], col = "blue", type = "o")

legend("topright", legend=c("Cluster 1", "Cluster 2", "Cluster 3"),
       col=c("red", "green", "blue"), lty=1:2, cex=0.8, bg="transparent")

print("Clustering a 3 cluster:")

for (i in 1:3) {
  print(paste(
    "Groupe ",
    i ,
    " : ",
    sum(Table_clustered3 == i) / nrow(Table_clustered3) * 100,
    " %"
  ))
  
}

k_fit <- kmeans(Table_to_clust[, 2:ncol(Table_to_clust)], 4)

Table_clustered4 <-
  data.frame(Table_to_clust$UserId, k_fit$cluster)

m <- as.matrix(k_fit$centers)

plot(
  k_fit$centers[1, 2:(ncol(Table_to_clust)-2)],
  col = "red",
  type = "o",
  ylab = "% de dépots",
  xlab = "Horaires",
  main = "Centers of Clustering (K = 4)",
  ylim = c(0,80)
)

points(m[2, 2:(ncol(Table_to_clust)-2)], col = "green", type = "o")

points(m[3, 2:(ncol(Table_to_clust)-2)], col = "blue", type = "o")

points(m[4, 2:(ncol(Table_to_clust)-2)], col = "black", type = "o")

legend("topright", legend=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4"),
       col=c("red", "green", "blue", "black"), lty=1:2, cex=0.8, bg="transparent")

print("Clustering a 4 cluster:")

for (i in 1:4) {
  print(paste(
    "Groupe ",
    i ,
    " : ",
    sum(Table_clustered4 == i) / nrow(Table_clustered4) * 100,
    " %"
  ))
  
}

k_fit <- kmeans(Table_to_clust[, 2:ncol(Table_to_clust)], 5)

Table_clustered5 <-
  data.frame(Table_to_clust$UserId, k_fit$cluster)

m <- as.matrix(k_fit$centers)

plot(
  k_fit$centers[1, 2:(ncol(Table_to_clust)-2)],
  col = "red",
  type = "o",
  ylab = "% de dépots",
  xlab = "Horaires",
  main = "Centers of Clustering (K = 5)",
  ylim = c(0,80)
)

points(m[2, 2:(ncol(Table_to_clust)-2)], col = "green", type = "o")

points(m[3, 2:(ncol(Table_to_clust)-2)], col = "blue", type = "o")

points(m[4, 2:(ncol(Table_to_clust)-2)], col = "black", type = "o")

points(m[5, 2:(ncol(Table_to_clust)-2)], col = "yellow", type = "o")

legend("topright", legend=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5"),
       col=c("red", "green", "blue", "black", "yellow"), lty=1:2, cex=0.8, bg="transparent")

print("Clustering a 5 cluster:")

for (i in 1:5) {
  print(paste(
    "Groupe ",
    i ,
    " : ",
    sum(Table_clustered5 == i) / nrow(Table_clustered5) * 100,
    " %"
  ))
  
}
k = 5;
vec_qty = vector();
vec_size = vector();
for(i in 1:k){
  user_from_clust <- Table_clustered5[Table_clustered5$k_fit.cluster==i,]$Table_to_clust.UserId
  
  vec_qty <- c(vec_qty, mean(Table_clust_user_4h[as.character(Table_clust_user_4h$UserId) %in%
                                                  as.character(user_from_clust),]$Qty));
  vec_size <- c(vec_size, mean(Table_clust_user_4h[as.character(Table_clust_user_4h$UserId) %in%
                                                   as.character(user_from_clust),]$Size));
}
plot(vec_qty, type="h", col="red", main=paste("Average Quantity à", k, "clusters"));
plot(vec_size, type="h", col="blue", main=paste("Average Size à", k, "clusters"));
# rm(vec_qty, k);