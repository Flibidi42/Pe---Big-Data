tot_dep <- totaux_depots[!is.na(totaux_depots$typeD),]
#tot_dep <- tot_dep[tot_dep$typeD==1,]

#Création de la table échantillonée par tranche de 2h simple
print("Clustering Users");
source("Clustering/Users/ClusteringUsers.R");

#Création de la table échantillonée par tranche de 2h en tenant compte de la date et de l'heure
#(10 dépots sur une meme tranche horaire comptent pour 1)
print("Clustering Users with date (un peu long)");
source("Clustering/Users/ClusteringUser - with date.R");

#Création de la table avec date, échantillonée à 4h
print("Clustering by 4h");
source("Clustering/Users/ClusteringBy4H.R");

#Clustring with K-means
print("Clustering with K-means");
source("Clustering/Users/Clustering-KMeans.R");