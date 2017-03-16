

#Clustering User Date
k_fit <- kmeans(Table_clust_user_date[, 2:13], 2)

Table_clustered <-
  data.frame(Table_clust_user_date$UserId, k_fit$cluster)

m <- as.matrix(k_fit$centers)

plot(
  k_fit$centers[1, ],
  col = "red",
  type = "o",
  ylab = "Nb de dépots",
  xlab = "Horaires",
  main = "Centers of Clustering (K = 2)"
)

points(m[2, ], col = "green", type = "o")


print("Clustering a 2 cluster:")

for (i in 1:2) {
  print(paste(
    "Groupe ",
    i ,
    " : ",
    sum(Table_clustered == i) / nrow(Table_clustered) * 100,
    " %"
  ))
  
}

k_fit <- kmeans(Table_clust_user_date[, 2:13], 3)

Table_clustered <-
  data.frame(Table_clust_user_date$UserId, k_fit$cluster)

m <- as.matrix(k_fit$centers)

plot(
  k_fit$centers[1, ],
  col = "red",
  type = "o",
  ylab = "Nb de dépots",
  xlab = "Horaires",
  main = "Centers of Clustering (K = 3)"
)

points(m[2, ], col = "green", type = "o")

points(m[3, ], col = "blue", type = "o")


print("Clustering a 3 cluster:")

for (i in 1:3) {
  print(paste(
    "Groupe ",
    i ,
    " : ",
    sum(Table_clustered == i) / nrow(Table_clustered) * 100,
    " %"
  ))
  
}

k_fit <- kmeans(Table_clust_user_date[, 2:13], 4)

Table_clustered <-
  data.frame(Table_clust_user_date$UserId, k_fit$cluster)

m <- as.matrix(k_fit$centers)

plot(
  k_fit$centers[1, ],
  col = "red",
  type = "o",
  ylab = "Nb de dépots",
  xlab = "Horaires",
  main = "Centers of Clustering (K = 4)"
)

points(m[2, ], col = "green", type = "o")

points(m[3, ], col = "blue", type = "o")

points(m[4, ], col = "black", type = "o")


print("Clustering a 4 cluster:")

for (i in 1:4) {
  print(paste(
    "Groupe ",
    i ,
    " : ",
    sum(Table_clustered == i) / nrow(Table_clustered) * 100,
    " %"
  ))
  
}

k_fit <- kmeans(Table_clust_user_date[, 2:13], 5)

Table_clustered <-
  data.frame(Table_clust_user_date$UserId, k_fit$cluster)

m <- as.matrix(k_fit$centers)

plot(
  k_fit$centers[1, ],
  col = "red",
  type = "o",
  ylab = "Nb de dépots",
  xlab = "Horaires",
  main = "Centers of Clustering (K = 5)"
)

points(m[2, ], col = "green", type = "o")

points(m[3, ], col = "blue", type = "o")

points(m[4, ], col = "black", type = "o")

points(m[5, ], col = "yellow", type = "o")


print("Clustering a 5 cluster:")

for (i in 1:5) {
  print(paste(
    "Groupe ",
    i ,
    " : ",
    sum(Table_clustered == i) / nrow(Table_clustered) * 100,
    " %"
  ))
  
}