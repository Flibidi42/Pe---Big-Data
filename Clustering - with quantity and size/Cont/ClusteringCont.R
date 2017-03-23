library(fpc);
Table_to_clust <- Table_clustering_cont

for(k in 2:4){

#Clustering User Date
k_fit <- kmeans(Table_to_clust[, 2:ncol(Table_to_clust)], k)
with(Table_to_clust, 
     pairs(Table_to_clust[, 2:ncol(Table_to_clust)], col=c(1:3)[k_fit$cluster]),
     main=paste("K-means w/ k =", k)) 
}
