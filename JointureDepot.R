#Jointure exprimant les depot des utilisateurs en fonction des conteneurs
#IdD<-vector();#Primary key
index<-integer();
JDepot<-list()
IdUserD<-vector();#Foreign key
IdContD<-vector();#Foreign key
typeD<-vector();
sizeD<-vector();
DateD<-vector();
#print(nrow(contClass))
for (i in 1:nrow(contClass)){#Initialisation de la liste
  JDepot[[i]]<-data.frame(IdUserD,IdContD,sizeD,typeD,DateD)
  #print(JDepot[[i]])
}
#print("exit")
for (i in 1:length(DepotListe)) {
  IdUserD<-vector();#Foreign key
  IdContD<-vector();#Foreign key
  typeD<-vector();
  sizeD<-vector();
  DateD<-vector();
  #Parcours de chaque requete
  if (is.null(DepotListe[[i]])) {
  }else{
    if(is.element(as.character(ID_Conteneur[i]),contClass$IDCont)){#Vérification de la validité des conteneurs
      index<-grep(as.character(ID_Conteneur[i]),contClass$IDCont)
      for (j in 1:nrow(DepotListe[[i]])) {
        #Parcours de chaque dÃ©pot au sein de la requÃªte
        if (is.na(DepotListe[[i]][j, "UserId"])) {#TODO : Compter la proportion de na au sein du set de donn?e
          #print(DepotListe[[i]][j,"UserId"])
        }else if(substring(as.character(DepotListe[[i]][j,"DepotDate"]),1,4)<"2015"){#Hypothese: les mesures commencent au 1er janvier 2015
          #print(as.character(DepotListe[[i]][j,"DepotDate"]));
        }else{
          #IdD <-c(IdD,length(IdD)+1);
          #print("coucou")
          JDepot[[index]]<- rbind(JDepot[[index]],data.frame(IdUserD=as.character(DepotListe[[i]][j, "UserId"]),IdContD=as.character(ID_Conteneur[i]),sizeD=as.character(DepotListe[[i]][j, "WasteSize"]),typeD=as.character(DepotListe[[i]][j,"WasteType"]),DateD=as.character(DepotListe[[i]][j,"DepotDate"])))
          #JDepot[[i]]$IdUserD <- c(JDepot[[i]]$IdUserD, as.character(DepotListe[[i]][j, "UserId"]))
          #JDepot[[i]]$IdContD <- c(JDepot[[i]]$IdContD,as.character(ID_Conteneur[i]))
          #JDepot[[i]]$sizeD <- c(JDepot[[i]]$sizeD, as.character(DepotListe[[i]][j, "WasteSize"]))
          #JDepot[[i]]$typeD<-c(JDepot[[i]]$typeD,as.character(DepotListe[[i]][j,"WasteType"]))
          #JDepot[[i]]$DateD<-c(JDepot[[i]]$DateD,as.character(DepotListe[[i]][j,"DepotDate"]))
        }
      }
    }
  }
}
for(i in 1:nrow(contClass)){
JDepot[[i]]<-JDepot[[i]][order(JDepot[[i]]$DateD),]
}
#rm(IdUserD,IdContD,sizeD,typeD,DateD)
#Vecteur definissant les dates et les jours associ?s.
Rprof()
