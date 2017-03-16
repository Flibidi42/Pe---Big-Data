#**** testons !!! 5-410
vecteur_ma_selection <- vctr_sum_deposits[5:396]
matrice_selection <- matrix(vecteur_ma_selection, ncol=7)

matrice_selection_2 <- matrix(nrow = nrow(matrice_selection), ncol = ncol(matrice_selection))
for(i in 1:nrow(matrice_selection)){
  for(j in 1:ncol(matrice_selection)){
    matrice_selection_2[i,j]<-matrice_selection[[i,j]]  
  }
}
matrice_selection_2

somme = colSums(matrice_selection)
vecteur_ma_selection
vctr_sum_deposits
plot(jours)
plot(somme)