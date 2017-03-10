listeDepotsTotaux
class(listeDepotsTotaux)
listeDepotsTotaux[nrow(listeDepotsTotaux),"jour"]
a <- matrix(0,listeDepotsTotaux[nrow(listeDepotsTotaux),"jour"],2)
colnames(a) <- c("date","item")
listeDepotsTotauxAvecFrequenceConstante <- data.frame(a)

iterateur <- 1
listeDepotsTotaux
for(i in 1:nrow(listeDepotsTotauxAvecFrequenceConstante)){
  a <- listeDepotsTotaux[iterateur,1]
  if(i==(listeDepotsTotaux[iterateur,1])){
    listeDepotsTotauxAvecFrequenceConstante[i,2] <- a
    iterateur <- iterateur + 1
  }
}

listeDepotsTotauxMatrice <- data.matrix(listeDepotsTotauxAvecFrequenceConstante[,2])
listeDepotsTotauxMatrice
listeDepotsTotauxSerieTemporelle = ts(listeDepotsTotauxMatrice)
plot.ts(listeDepotsTotauxMatrice)
