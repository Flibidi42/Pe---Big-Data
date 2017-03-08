#Jointure exprimant les dépot des utilisateurs en fonction des conteneurs

#IdD<-vector();#Primary key
IdUserD<-vector();#Foreign key
IdContD<-vector();#Foreign key
typeD<-vector();
sizeD<-vector();
DateD<-vector()
k<-vector()
for (i in 1:length(DepotListe)) {
  #Parcours de chaque requÃªte
  if (is.null(DepotListe[[i]])) {
  }else{
    for (j in 1:nrow(DepotListe[[i]])) {
      k <-c(k,length(k)+1);
      #Parcours de chaque dÃ©pot au sein de la requÃªte
      if (is.na(DepotListe[[i]][j, "UserId"])) {#TODO : Compter la proportion de na au sein du set de donnée
        print(DepotListe[[i]][j,"UserId"])
      }else if(substring(as.character(DepotListe[[i]][j,"DepotDate"]),1,4)<"2015"){#Hypothèse: les mesures commencent au 1er janvier 2015
        print(as.character(DepotListe[[i]][j,"DepotDate"]));
      }else{
        #IdD <-c(IdD,length(IdD)+1);
        IdUserD <- c(IdUserD, as.character(DepotListe[[i]][j, "UserId"]))
        IdContD <- c(IdContD,as.character(ID_Conteneur[i]))
        sizeD <- c(sizeD, as.character(DepotListe[[i]][j, "WasteSize"]))
        typeD<-c(typeD,as.character(DepotListe[[i]][j,"WasteType"]))
        DateD<-c(DateD,as.character(DepotListe[[i]][j,"DepotDate"]))
        #Rajouter la date du dépot
      }
    }
  }
}

JDepot<-data.frame(IdUserD,IdContD,sizeD,typeD,DateD)
JDepot<-JDepot[order(JDepot$DateD),]
#Vecteur définissant les dates et les jours associés.

