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

