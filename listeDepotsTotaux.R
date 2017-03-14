#Formatage de l'entree des series temporelles #1

#ListeDepotsTotaux<-data.frame();

jourRelatif<-list();
# calendar<-seq(as.Date(JDepot[[1]][1,"DateD"]), as.Date("2020-12-31"), by="days")#(JDepot[[length(JDepot)]][nrow(JDepot[[length(JDepot)]]),"DateD"])
print("step1")
debut<-as.Date(JDepot[[1]][1,"DateD"])-as.Date.POSIXct(as.Date("2001-01-01"))
MinDate<-vector()
startDate<-as.Date("2100-12-31")
for(l in 1:length(JDepot)){
  if(nrow(JDepot[[l]])>0){
    if(as.numeric(startDate-as.Date(JDepot[[l]][1,"DateD"]))>0){
      startDate<-as.Date(JDepot[[l]][1,"DateD"])
      # for(i in 1:nrow(JDepot[[l]])){
      #   min()
      # }
    }
  }
}
for(l in 1 : length(JDepot)){
  jourRelatif[[l]]<-vector()
  if(nrow(JDepot[[l]])>0){
    for(i in 1 : nrow(JDepot[[l]])){
      jourRelatif[[l]]<-c(jourRelatif[[l]],as.numeric(as.Date(JDepot[[l]][i,"DateD"])-startDate+1))
    }
  }
}
print("step2")
listeDepotsTotaux<-list()
for (l in 1:length(JDepot)){
  JDepot[[l]]["jourRelatif"]<-jourRelatif[[l]]
  jour<-vector();
  NbObjDeposeTot<-vector()
  NbObjDepose1<-vector()
  NbObjDepose2<-vector()
  NbObjDepose3<-vector()
  NbObjDepose4<-vector()
  NbObjDepose5<-vector()
  k<-1
  jour<-c(jour,JDepot[[l]][1,"jourRelatif"])#init j
  NbObjDeposeTot<-c(NbObjDeposeTot,0)
  NbObjDepose1<-c(NbObjDepose1,0)
  NbObjDepose2<-c(NbObjDepose2,0)
  NbObjDepose3<-c(NbObjDepose3,0)
  NbObjDepose4<-c(NbObjDepose4,0)
  NbObjDepose5<-c(NbObjDepose5,0)
  if(nrow(JDepot[[l]])>0){
    for(i in 1:nrow(JDepot[[l]])){
      print(JDepot[[l]][i,"jourRelatif"])
      print(jour[k])
      print("passed")
      if(JDepot[[l]][i,"jourRelatif"]==jour[k]){
        NbObjDeposeTot[k]<-NbObjDeposeTot[k]+1
        if(JDepot[[l]][i,"typeD"]==1){
          NbObjDepose1[k]<-NbObjDepose1[k]+1}
        if(JDepot[[l]][i,"typeD"]==2){
          NbObjDepose2[k]<-NbObjDepose2[k]+1}
        if(JDepot[[l]][i,"typeD"]==3){
          NbObjDepose3[k]<-NbObjDepose3[k]+1}
        if(JDepot[[l]][i,"typeD"]==4){
          NbObjDepose4[k]<-NbObjDepose4[k]+1}
        if(JDepot[[l]][i,"typeD"]==5){
          NbObjDepose5[k]<-NbObjDepose5[k]+1}
      }else{
        k<-k+1
        jour<-c(jour,JDepot[[l]][i,"jourRelatif"])
        NbObjDeposeTot<-c(NbObjDeposeTot,1)
        if(JDepot[[l]][i,"typeD"]==1){
          NbObjDepose1<-c(NbObjDepose1,1)
          NbObjDepose2<-c(NbObjDepose2,0)
          NbObjDepose3<-c(NbObjDepose3,0)
          NbObjDepose4<-c(NbObjDepose4,0)
          NbObjDepose5<-c(NbObjDepose5,0)}
        if(JDepot[[l]][i,"typeD"]==2){
          NbObjDepose1<-c(NbObjDepose1,0)
          NbObjDepose2<-c(NbObjDepose2,1)
          NbObjDepose3<-c(NbObjDepose3,0)
          NbObjDepose4<-c(NbObjDepose4,0)
          NbObjDepose5<-c(NbObjDepose5,0)}
        if(JDepot[[l]][i,"typeD"]==3){
          NbObjDepose1<-c(NbObjDepose1,0)
          NbObjDepose2<-c(NbObjDepose2,0)
          NbObjDepose3<-c(NbObjDepose3,1)
          NbObjDepose4<-c(NbObjDepose4,0)
          NbObjDepose5<-c(NbObjDepose5,0)}
        if(JDepot[[l]][i,"typeD"]==4){
          NbObjDepose1<-c(NbObjDepose1,0)
          NbObjDepose2<-c(NbObjDepose2,0)
          NbObjDepose3<-c(NbObjDepose3,0)
          NbObjDepose4<-c(NbObjDepose4,1)
          NbObjDepose5<-c(NbObjDepose5,0)}
        if(JDepot[[l]][i,"typeD"]==5){
          NbObjDepose1<-c(NbObjDepose1,0)
          NbObjDepose2<-c(NbObjDepose2,0)
          NbObjDepose3<-c(NbObjDepose3,0)
          NbObjDepose4<-c(NbObjDepose4,0)
          NbObjDepose5<-c(NbObjDepose5,1)}
      }
    }
  }
  listeDepotsTotaux[[l]]<-data.frame(jour,NbObjDeposeTot,NbObjDepose1,NbObjDepose2,NbObjDepose3,NbObjDepose4,NbObjDepose5)
}
# rm(jour)
# rm(k,i,j)
