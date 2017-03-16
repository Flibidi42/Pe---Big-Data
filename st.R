#****  variables pour la boucle ****
start <- as.Date("2016-01-01")
end   <- as.Date("2017-03-02")
theDate <- start
selected_data_temp <- data.frame() 
selected_data <- data.frame()
vctr_sum_deposits <- vector()
vctr_date <- vector()
selected_data_temp <- data.frame()
#**** selection de tous les depots pour chaque jour de la periode entre les deux dates
while(theDate <= end){
  print(theDate)
  selected_data_temp <- nrow( subset(totaux_depots, DateD == theDate))
  vctr_sum_deposits <- c(vctr_sum_deposits,selected_data_temp)
  vctr_date <- c(vctr_date, theDate)
  theDate <- theDate+1}
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
selected_monday <- nrow( subset(totaux_depots, weekdays(as.Date(DateD)) == "dimancge" & start<=as.Date(DateD) & as.Date(DateD) <= end ))
jours <- c(jours, selected_monday)
plot(jours)

#**** visualisation ****
as.Date(vctr_date[1])
class(vctr_date[1])
df <- data.frame(vctr_date, vctr_sum_deposits)
vctr_sum_deposits_selection <- vctr_sum_deposits[4:410]

vctr_sum_deposits
st_depots <-ts(vctr_sum_deposits_selection, start=c(2016), frequency = 365)
plot.ts(st_depots)
st_depots
jours <- c("mercredi", "jeudi", "vendredi", "samedi", "dimanche","lundi","mardi")
depots <- data.frame(matrix(c(st_depots,0,0,0,0,0,0), ncol=7))
depots
colnames(depots)<-jours
somme <- vector()
somme = colSums(depots)
?plot
plot(somme)
weekdays(as.Date("2016-01-01"))
