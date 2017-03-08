listeDepotsTotaux
class(listeDepotsTotaux)
a <- matrix(0,listeDepotsTotaux[nrow(listeDepotsTotaux),2],2)
colnames(a) <- c("date","item")
listeDepotsTotauxAvecFrequenceConstante <- data.frame(a)
listeDepotsTotauxAvecFrequenceConstante
listeDepotsTotauxst <-ts()