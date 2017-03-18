# print("Clustering Users");
# source("Clustering/Users/MainClustering.R");
Table_croisee <- Table_clustered5;
Table_croisee <- Table_croisee[as.character(Table_croisee$Table_to_clust.UserId)
                                  %in% as.character(Pb_User$Users),]
tt <- table(Table_croisee$k_fit.cluster);
plot(as.vector(tt)/sum(tt), type = "l");
points(as.vector(table(Table_clustered5$k_fit.cluster))/
         nrow(Table_clustered5), col = "red", type = "l");
# print("Avec cluster")
# print(4)
# print(paste(", ", 