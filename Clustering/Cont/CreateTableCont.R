nb_cont <- 79
Path_to_csvs <- "JDepotBis/JdepotCSVwCont";

#Parameters for containers
ID_Conteneur <- vector();
Nb_dep_jr_moyenne <- vector();
Nb_dep_jr_mediane <- vector();
Taille_moyenne <- vector();
Nb_user_month <- vector();

pb <- txtProgressBar(title = "progress bar",
                     min = 0,
                     max = nb_cont)


for(i in 1:nb_cont){
  setTxtProgressBar(pb, i)
  #Lecture du fichier
  df_cont <- read.csv(file=paste(Path_to_csvs, i, ".csv", sep =""));
  if(nrow(df_cont)==0)
    next;
  df_cont <- df_cont[!is.na(df_cont$sizeD),];
  df_cont <- df_cont[!is.na(df_cont$typeD),];
  df_cont <- df_cont[df_cont$typeD==1,]
  if(nrow(df_cont)==0)
    next;
  
  ID_Conteneur <- c(ID_Conteneur, df_cont$IdContD[1])
  #Calcul nb de depots
  df_by_day <- df_cont[,-6];
  df_by_day <- cbind(df_by_day, as.character(df_cont$DateD))
  colnames(df_by_day) <- colnames(df_cont);
  df_by_day$DateD <- 
    sapply(df_by_day$DateD, function(x){strsplit(as.character(x)," ")[[1]][1]})
  df_by_day <-cbind(df_by_day, seq(1,1,length.out = nrow(df_by_day)));
  df_by_day <-cbind(df_by_day, seq(1,1,length.out = nrow(df_by_day)));
  colnames(df_by_day)[7] <- "aggreg";
  aggreg <- aggregate(aggreg ~ DateD, df_by_day, sum);
  Nb_dep_jr_moyenne <- c(Nb_dep_jr_moyenne, mean(aggreg[,2]));
  Nb_dep_jr_mediane <- c(Nb_dep_jr_mediane, median(aggreg[,2]));
  
  #Calcul Taille depot
  Taille_moyenne <- c(Taille_moyenne, mean(df_cont$sizeD));
  
  # Calcul nb user/mois moyen
  df_by_month <-df_by_day;
  df_by_month$DateD <-as.POSIXlt(strptime(df_by_month$DateD, format = "%F"))
  df_by_month$DateD <- df_by_month$DateD$mon + df_by_month$DateD$year * 12
  aggreg <- aggregate(IdUserD ~ DateD, df_by_month, as.vector);
  res <- sapply(aggreg[,2], function(x) length(unique(x)));
  Nb_user_month <- c(Nb_user_month, mean(res));
}

Table_clustering_cont <- data.frame(ID_Conteneur,
                                    Nb_dep_jr_moyenne,
                                    Nb_dep_jr_mediane,
                                    Taille_moyenne,
                                    Nb_user_month)

rm(ID_Conteneur, Nb_dep_jr_mediane, Nb_dep_jr_moyenne, Taille_moyenne, Nb_user_month, 
   df_by_day, df_by_month, df_cont, res, aggreg);
write.csv(Table_clustering_cont, "Clustering/Cont/ClusteringCont.csv")