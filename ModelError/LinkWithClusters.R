Table_consideree <- Table_clustered3

Table_croisee <-
  Table_consideree[as.character(Table_consideree$Table_to_clust.UserId)
                   %in% as.character(Pb_User$Users),]
tt <- table(Table_croisee$k_fit.cluster)

plot(
  as.vector(tt) / sum(tt),
  type = "p",
  ylim = c(0, 1),
  col = "red",
  main = "Relation cluster/erreur users"
)

points(as.vector(table(Table_consideree$k_fit.cluster)) /
         nrow(Table_consideree),
       col = "blue",
       type = "p")

rm(Table_croisee, Table_consideree)
