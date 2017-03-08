#Jointure exprimant les depot des utilisateurs en fonction des conteneurs

#IdD<-vector();#Primary key
IdUserD<-vector();#Foreign key
IdContD<-vector();#Foreign key
typeD<-vector();
sizeD<-vector();
DateD<-vector()
for (i in 1:length(DepotListe)) {
  #Parcours de chaque requete
  if (is.null(DepotListe[[i]])) {
  }else{
    for (j in 1:nrow(DepotListe[[i]])) {
      #Parcours de chaque dépot au sein de la requête
      if (is.na(DepotListe[[i]][j, "UserId"])) {#TODO : Compter la proportion de na au sein du set de donn?e
        print(DepotListe[[i]][j,"UserId"])
      }else if(substring(as.character(DepotListe[[i]][j,"DepotDate"]),1,4)<"2015"){#Hypothese: les mesures commencent au 1er janvier 2015
        print(as.character(DepotListe[[i]][j,"DepotDate"]));
      }else{
        #IdD <-c(IdD,length(IdD)+1);
        IdUserD <- c(IdUserD, as.character(DepotListe[[i]][j, "UserId"]))
        IdContD <- c(IdContD,as.character(ID_Conteneur[i]))
        sizeD <- c(sizeD, as.character(DepotListe[[i]][j, "WasteSize"]))
        typeD<-c(typeD,as.character(DepotListe[[i]][j,"WasteType"]))
        DateD<-c(DateD,as.character(DepotListe[[i]][j,"DepotDate"]))
        #Rajouter la date du depot
      }
    }
  }
}

JDepot<-data.frame(IdUserD,IdContD,sizeD,typeD,DateD)
JDepot<-JDepot[order(JDepot$DateD),]
#Vecteur definissant les dates et les jours associes.

