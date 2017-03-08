#Formatage de l'entr?e des s?ries temporelles #1

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
NbObjDepose<-vector()
k<-1
jour<-c(jour,JDepot[1,"jourRelatif"])#init j
NbObjDepose<-c(NbObjDepose,0)
for(i in 1:nrow(JDepot)){
  if(JDepot[i,"jourRelatif"]==jour[k]){
    NbObjDepose[k]<-NbObjDepose[k]+1
  }else{
    k<-k+1
    jour<-c(jour,JDepot[i,"jourRelatif"])
    NbObjDepose<-c(NbObjDepose,1)
  }
}
listeDepotsTotaux<-data.frame(jour,NbObjDepose)
listeDepotsTotaux
