#**** testons !!! 5-410
vecteur_ma_selection <- vctr_sum_deposits[5:396]
matrice_selection <- matrix(vecteur_ma_selection, ncol=7)
somme = colSums(matrice_selection)
vecteur_ma_selection
vctr_sum_deposits
plot(jours)
plot(somme)
