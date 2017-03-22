str_path ="./JDepotBis/"
str_file_name ="JdepotCSVwCont"
my_data_ok <- list()

for(i in 1:79){
  my_data_ok[[i]] <- read.csv(paste(str_path, str_file_name,i,".csv",sep = ""))
}

#avec les heures
totaux_depots_avec_heure <- data.frame()
for(i in 1:79){
  totaux_depots_avec_heure <- rbind(totaux_depots_avec_heure, my_data_ok[[i]])
}
rm(my_data_ok)

totaux_depots <- totaux_depots_avec_heure
totaux_depots$DateD <- as.Date(totaux_depots$DateD)


totaux_depots_avec_heure <- totaux_depots_avec_heure[order(DateD),]
totaux_depots <- totaux_depots[order(DateD),]

totaux_depots_avec_heure<-totaux_depots_avec_heure[order(totaux_depots_avec_heure$DateD),]
#sans les heures
totaux_depots_avec_heure$DateD <- as.POSIXct(strptime(totaux_depots_avec_heure$DateD, format = "%Y-%m-%d %H:%M:%S")) 
totaux_depots_avec_heure <- totaux_depots_avec_heure[!(is.na(totaux_depots_avec_heure$DateD)),]