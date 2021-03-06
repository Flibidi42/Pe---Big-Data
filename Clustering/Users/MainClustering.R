tot_dep <- totaux_depots[!is.na(totaux_depots$typeD),]

#Cr�ation de la table �chantillon�e par tranche de 2h simple
print("Clustering Users (un peu long)");
source("Clustering/Users/ClusteringUsers.R");

#Cr�ation de la table �chantillon�e par tranche de 2h en tenant compte de la date et de l'heure
#(10 d�pots sur une meme tranche horaire comptent pour 1)
print("Clustering Users with date");
source("Clustering/Users/ClusteringUser - with date.R");

#Cr�ation de la table avec date, �chantillon�e � 4h
print("Clustering by 4h");
source("Clustering/Users/ClusteringBy4H.R");

#Clustring with K-means
print("Clustering with K-means");
source("Clustering/Users/Clustering-KMeans.R");