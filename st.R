library(plyr)
#****  variables pour la boucle ****
start <- as.Date("2016-01-01")
end   <- as.Date("2017-03-02")
theDate <- start
selected_data_temp <- data.frame() 
selected_data <- data.frame()
vctr_sum_deposits <- vector()
vctr_date <- vector()
selected_data_temp <- data.frame()

subset(totaux_depots, as.Date(DateD) == theDate)

#**** selection de tous les depots pour chaque jour de la periode entre les deux dates
while(theDate <= end){
  vector_boolean <- totaux_depots$DateD == theDate
  vector_boolean
  #vctr_sum_deposits <- c(vctr_sum_deposits,as.numeric(table(vector_boolean)["TRUE"]))
  vctr_sum_deposits <- c(vctr_sum_deposits, nrow( subset(totaux_depots, as.Date(DateD) == theDate )))
  vctr_date <- c(vctr_date, theDate)
  print(theDate)
  theDate <- theDate+1
}

date_depots <- data.frame(vctr_date, vctr_sum_deposits)
date_depots
#v?©rification
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
