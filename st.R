library(plyr)
#****  variables pour la boucle ****
start <- as.Date("2016-01-01")
end   <- as.Date("2017-03-02")
theDate <- start
selected_data_temp <- data.frame() 
selected_data <- data.frame()
vctr_sum_deposits <- data.frame()
vctr_date <- data.frame()
selected_data_temp <- data.frame()

#**** selection de tous les depots pour chaque jour de la periode entre les deux dates
while(theDate <= end){
  vector_boolean_0 <- as.Date(totaux_depots$DateD) == theDate
  vector_boolean_1 <- as.Date(totaux_depots$DateD) >= start
  vector_boolean_2 <- as.Date(totaux_depots$DateD) <= end
  vector_boolean <- (vector_boolean_0 & vector_boolean_1 & vector_boolean_2)
  vector_boolean
  vctr_sum_deposits <- c(vctr_sum_deposits,table(vector_boolean)["TRUE"])
  vctr_date <- c(vctr_date, theDate)
  print(theDate)
  theDate <- theDate+1
  }
#vérification
theDate <- start
selected_monday <-data.frame()
vctr_sum_deposits_onmonday <- vector()
selected_monday <- nrow( subset(totaux_depots, weekdays(as.Date(DateD)) == "lundi" & start<=as.Date(DateD) & as.Date(DateD) <= end ))
jours <- c(selected_monday)
selected_monday <- nrow( subset(totaux_depots, weekdays(as.Date(DateD)) == "mardi" & start<=as.Date(DateD) & as.Date(DateD) <= end ))
jours <- c(jours, selected_monday)
selected_monday <- nrow( subset(totaux_depots, weekdays(as.Date(DateD)) == "mercredi" & start<=as.Date(DateD) & as.Date(DateD) <= end ))
jours <- c(jours, selected_monday)
selected_monday <- nrow( subset(totaux_depots, weekdays(as.Date(DateD)) == "jeudi" & start<=as.Date(DateD) & as.Date(DateD) <= end ))
jours <- c(jours, selected_monday)
selected_monday <- nrow( subset(totaux_depots, weekdays(as.Date(DateD)) == "vendredi" & start<=as.Date(DateD) & as.Date(DateD) <= end ))
jours <- c(jours, selected_monday)
selected_monday <- nrow( subset(totaux_depots, weekdays(as.Date(DateD)) == "samedi" & start<=as.Date(DateD) & as.Date(DateD) <= end ))
jours <- c(jours, selected_monday)
selected_monday <- nrow( subset(totaux_depots, weekdays(as.Date(DateD)) == "dimanche" & start<=as.Date(DateD) & as.Date(DateD) <= end ))
jours <- c(jours, selected_monday)

vecteur_ma_selection <- vctr_sum_deposits[5:410]
ma_selection_vecteur <- c(ma_selection_vecteur)
matrice_selection <- matrix(vecteur_ma_selection, ncol=7)
matrice_selection[[1,1]]
class(matrice_selection)
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

