#on veut visualiser des données
# -d'un ensemble de conteneur
# -sur une certaine période (date de début, date de fin)
# -en se restreignant éventuellement à un ou plusieurs jours de la semaine
# -en se restreignant éventuellement à une certaine partie de la journée
# -en additionnant ou en separant les courbes par container
# -en additionnant ou en separant les courbes par type OU PAS
# -en differenciant selon le statut d'enregistrement 
install.packages(ggplot2)
install.packages(data.table)
install.packages(grid)
install.packages(gridExtra)
install.packages(plyr)

library(ggplot2)
library(data.table)
library(grid)
library(gridExtra)

liste_conteneurs <- list()
# liste_conteneurs[1] <- "FR108AA15111"
liste_donnees_par_jour <- list()
# liste_conteneurs[2] <- "FR102AA15111"



liste_jours <- list("lundi", "jeudi")
liste_jours
 # liste_jours[1]<- "lundi"
 # liste_jours[2]<- "mardi"
 # liste_jours[3]<-"mercredi"
 # liste_jours[4]<-"jeudi"
 # liste_jours[5]<-"vendredi"
 # liste_jours[6]<-"samedi"
 # liste_jours[7]<-"dimanche"

 bool_graph_separes = TRUE
 bool_graph_par_container = FALSE
 bool_separer_par_utilisateur = FALSE
 bool_selection_abonnes = TRUE
 bool_selection_non_abonnes = FALSE
 
date_de_debut <- as.POSIXlt(strptime("2016-01-01 08:30:00", format = "%Y-%m-%d %H:%M:%S"))
date_de_fin <- as.POSIXlt(strptime("2016-12-01 23:59:00", format = "%Y-%m-%d %H:%M:%S"))

separation_par_container <- FALSE
heure_debut <- ""
heure_fin <- ""


##on commence avec seulement, affichage entre deux dates
sous_tab <- data.frame()
sous_tab <- totaux_depots_avec_heure[ totaux_depots_avec_heure$DateD >=date_de_debut,]
sous_tab <- sous_tab[sous_tab$DateD<= date_de_fin,]
sous_tab <- sous_tab[order(sous_tab$DateD),]

sous_tab
##on s'occupe de selectionner selon le statut des utilisateurs
if(bool_selection_non_abonnes){
  sous_tab <- sous_tab[sous_tab$IdUserD=="AAAAAAAAAAA=",]
}else if(bool_selection_abonnes){
  sous_tab <- sous_tab[sous_tab$IdUserD!="AAAAAAAAAAA=",]
}

##ensuite, cas ou on souhaite ne recuperer que certains conteneurs
if(length(liste_conteneurs)!=0){
  sous_tab_temp <- sous_tab
  sous_tab_temp <- sous_tab[sous_tab$IdContD==liste_conteneurs[[1]], ]
  if(length(liste_conteneurs)>=2){
    for(i in 2:length(liste_conteneurs)){
      sous_tab_temp <- rbind(sous_tab_temp, sous_tab[sous_tab$IdContD==liste_conteneurs[[i]], ])
    }
  }
  sous_tab <- sous_tab_temp[order(sous_tab_temp$DateD),]
  rm(sous_tab_temp)
}
#cas ou on ne veut récupérer que certains jours de la semaine

 if(length(liste_jours)!=0){

   for(i in 1:length(liste_jours)){

     if(liste_jours[[i]]=="lundi"){
       liste_donnees_par_jour[[1]] <- sous_tab[weekdays.POSIXt(sous_tab$DateD)=="lundi", ]
  
     } else if(liste_jours[[i]]=="mardi"){
       liste_donnees_par_jour[[2]] <- sous_tab[weekdays.POSIXt(sous_tab$DateD)=="mardi", ]
  
     } else if(liste_jours[[i]]=="mercredi"){
       liste_donnees_par_jour[[3]] <- sous_tab[weekdays.POSIXt(sous_tab$DateD)=="mercredi", ]
  
     } else if(liste_jours[[i]]=="jeudi"){
       liste_donnees_par_jour[[4]] <- sous_tab[weekdays.POSIXt(sous_tab$DateD)=="jeudi", ]
  
     } else if(liste_jours[[i]]=="vendredi"){
       liste_donnees_par_jour[[5]] <- sous_tab[weekdays.POSIXt(sous_tab$DateD)=="vendredi", ]
  
     } else if(liste_jours[[i]]=="samedi"){
       liste_donnees_par_jour[[6]] <- sous_tab[weekdays.POSIXt(sous_tab$DateD)=="samedi", ]
  
     } else if(liste_jours[[i]]=="dimanche"){
       liste_donnees_par_jour[[7]] <- sous_tab[weekdays.POSIXt(sous_tab$DateD)=="dimanche", ]
  
     }
     #éventuellement ordonner par date au cas ou !!!
    }


}


#ensuite, cas ou ne souhaite que recupere des objets de certaines taille
#on calcule le cumul de depots
cumule <- matrix(ncol = 1, data = 1:nrow(sous_tab))
sous_tab <- cbind(sous_tab, cumule)

#on les affiche
theme_set(theme_bw())
#discerner selon qu'on affiche en continu ou par jours
if(length(liste_jours)==0){
  
  ggplot(data = sous_tab, mapping = aes(x = DateD, y = cumule)) + geom_line()
  
} 


#*************  PARTIE POUR SEPARATION PAR JOURS  *******************************

if(length(liste_donnees_par_jour)>=1){
  jours <- matrix(nrow = 1, data = c("lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche"))
  #pour remplir avec des NULL si nécessaire
  liste_donnees_par_jour[[8]]<-8

  #TODO : faire ça correctement  
  sortie_par_jours<-data.frame("2016-01-01",1,"lundi")
  names(sortie_par_jours) <- c("date","nb_depots","id")
  sortie_par_jours$date <- as.Date(sortie_par_jours$date)
  sortie_par_jours <-data_temp_cumule[data_temp_cumule$nb_depots!=1,]

  for(i in 1:7){
    print("on est à : ")
    print(i)
    if(!(is.null(liste_donnees_par_jour[[i]]))){
      data_temp <- liste_donnees_par_jour[[i]]
      #data_temp$DateD <- as.Date(data_temp$DateD)
      #data_temp contient toutes les entrees correspondant au ième jour de la semaine [1:7]
      jours_uniques <- subset(data_temp, select=c("DateD"))
      jours_uniques <- unique(jours_uniques)
      rownames(jours_uniques) <- NULL
      if(nrow(jours_uniques)!=0){
        for(j in 1:nrow(jours_uniques)){
          print(j)
          sel_ <- data_temp[(data_temp$DateD==jours_uniques[j,1]),]
          v<-data.frame(jours_uniques[j,1], nrow(sel_), jours[1,i])
          names(v) <- c("date","nb_depots","id")
          #v$date <- as.Date(as.character(v$date))
          sortie_par_jours <- rbind( sortie_par_jours, v )
        }
      }
      
    }
  }
  
  sortie_par_jours$date <- as.Date(as.character(sortie_par_jours$date))
  if(bool_graph_separes){
    p <- ggplot(data = sortie_par_jours, aes(x=date, y=nb_depots,colour =id, fill=id), main = "test")+ geom_col()+ facet_wrap(~id, scale="free")
  }
  else{
    p <- ggplot(data = sortie_par_jours, aes(x=date, y=nb_depots,colour =id, fill=id))+  geom_col()
  }
  p <- ggplot(data = sortie_par_jours, aes(x=date, y=nb_depots,colour =id, fill=id), main = "test")+ geom_col()+ facet_wrap(~id, scale="free")
  ?ggplot
  print(p)
}