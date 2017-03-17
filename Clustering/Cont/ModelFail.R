nb_cont <- 79
Path_to_csvs <- "JDepotBis/JdepotCSVwCont";
pb <- txtProgressBar(title = "progress bar",
                     min = 0,
                     max = nb_cont)
Taux_fail = vector();

for(i in 1:nb_cont){
  setTxtProgressBar(pb, i)
  #Lecture du fichier
  df_cont <- read.csv(file=paste(Path_to_csvs, i, ".csv", sep =""));
  if(nrow(df_cont)==0)
    next;
  Taux_fail <- c(Taux_fail, sum(is.na(df_cont$typeD) | is.na(df_cont$sizeD) | 
                                  df_cont$typeD !=1 )/nrow(df_cont));
}

Std_dev = sd(Taux_fail);
Var = var(Taux_fail);