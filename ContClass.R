#Building the dataFrame related to containors


LatitudeCont <- vector();
LongitudeCont <- vector();
IDCont <- vector();

print("Création de la table des conteneurs")
for(i in 1:length(ID_Conteneur)){
  if(Latitude[i]>0){
    if(is.element(ID_Conteneur[i],IDCont)){}
    else{
      IDCont<-c(IDCont,ID_Conteneur[i]);
      LatitudeCont<-c(LatitudeCont,Latitude[i]);
      LongitudeCont<-c(LongitudeCont,Longitude[i])
    }
  }
}
contClass <- data.frame(IDCont,LatitudeCont,LongitudeCont)