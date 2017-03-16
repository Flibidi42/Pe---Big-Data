#**** testons !!! 5-410
vecteur_ma_selection <- vctr_sum_deposits[5:396]
matrice_selection <- matrix(vecteur_ma_selection, ncol=7)
matrice_selection[1,1]
apply(matrice_selection[[1]])
#somme <- colSums(matrice_selection)
somme <- matrix()

plot(jours)
plot(somme)
