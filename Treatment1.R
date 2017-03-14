NbAnonymes<-integer()
for(i in 1:length(JDepot)){
  NbAnonymes<-c(NbAnonymes,as.numeric(nrow(subset(JDepot[[i]], IdUserD=='AAAAAAAAAAA='))))
}
NbAnonymes<-sum(NbAnonymes)