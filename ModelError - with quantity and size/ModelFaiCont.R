nb_cont <- 79
nb_min_depots <- 30
seuil_refus <- 80
valeur_test <- 0.05
Path_to_csvs <- "JDepotBis/JdepotCSVwCont"

pb <- txtProgressBar(title = "progress bar",
                     min = 0,
                     max = nb_cont)
Taux_fail = vector()


for (i in 1:nb_cont) {
  setTxtProgressBar(pb, i)
  #Lecture du fichier
  df_cont <- read.csv(file = paste(Path_to_csvs, i, ".csv", sep = ""))
  
  if (nrow(df_cont) < nb_min_depots)
    next
  
  Taux_fail <-
    c(Taux_fail,
      sum(
        is.na(df_cont$typeD) | is.na(df_cont$sizeD) |
          df_cont$typeD %in% c(0, 2, 4, 5)
      ) / nrow(df_cont))
  
}

Std_dev = sd(Taux_fail)

Mean = mean(Taux_fail)


#plot curve
x <- seq(-0.5, 1, length.out = 1000)
plot(x, dnorm(x, Mean, Std_dev), col = "black", type = "l", xlim=c(-0.05,0.5))
abline(v = qnorm(seuil_refus / 100, Mean, Std_dev),
       col = "blue")

#Plot points
x <- Taux_fail[Taux_fail>=qnorm(seuil_refus / 100, Mean, Std_dev)]
f_norm <- dnorm(x, Mean, Std_dev);
points(x, f_norm, col="red");
x <- Taux_fail[Taux_fail<qnorm(seuil_refus / 100, Mean, Std_dev)]
f_norm <- dnorm(x, Mean, Std_dev);
points(x, f_norm, col="green");



print("Exemple de validation :")

print(paste(
  "Avec",
  valeur_test,
  ":",
  100 * pnorm(valeur_test, Mean, Std_dev),
  "%"
))
if (100 * pnorm(valeur_test, Mean, Std_dev) < seuil_refus) {
  print("Acceptable")
  
} else{
  print("refus")
}