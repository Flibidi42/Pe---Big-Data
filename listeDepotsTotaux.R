#Formatage de l'entrée des séries temporelles #1

#ListeDepotsTotaux<-data.frame();
jourRelatif<-vector();
calendar<-seq(as.Date(JDepot[1,"DateD"]), as.Date(JDepot[nrow(JDepot),"DateD"]), by="days")
for(i in 1:nrow(JDepot)){
  j<-1
  while(as.Date(JDepot[i,"DateD"])!=as.Date(calendar[j])){
    j<-j+1
  }
  jourRelatif<-c(jourRelatif,j)
}
JDepot["jourRelatif"]<-jourRelatif
rm(jourRelatif)
jour<-vector();
NbObjDeposeTot<-vector()
k<-1
jour<-c(jour,JDepot[1,"jourRelatif"])#init j
NbObjDeposeTot<-c(NbObjDeposeTot,0)
for(i in 1:nrow(JDepot)){
  if(JDepot[i,"jourRelatif"]==jour[k]){
    NbObjDeposeTot[k]<-NbObjDeposeTot[k]+1
  }else{
    k<-k+1
    jour<-c(jour,JDepot[i,"jourRelatif"])
    NbObjDeposeTot<-c(NbObjDeposeTot,1)
  }
}
listeDepotsTotaux<-data.frame(jour,NbObjDeposeTot)
rm(jour,NbObjDeposeTot)
rm(k,i,j)