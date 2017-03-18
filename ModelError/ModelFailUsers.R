Taux_fail <- Table_error_users$Ratio
seuil_refus <- 90
Mean = mean(Taux_fail);
Std_dev = sd(Taux_fail);
valeur_test <- 0.08

#plot curve
x <- seq(-0.5, 1, length.out = 1000)
plot(x, dnorm(x, Mean, Std_dev), col = "black", type = "l", main="Loi normale pour utilisateurs")
abline(v = qnorm(seuil_refus / 100, Mean, Std_dev),
       col = "blue")

#Plot points
x <- Taux_fail[Taux_fail>qnorm(seuil_refus / 100, Mean, Std_dev)]
f_norm <- dnorm(x, Mean, Std_dev);
points(x, f_norm, col="red");
x <- Taux_fail[Taux_fail<=qnorm(seuil_refus / 100, Mean, Std_dev)]
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

causes <- c("Erreur", "",  "Depot Invalide", "Dechet inconnu", "Fraude", "Mauvaise utilisation");
Pb_User <- Table_error_users[Table_error_users$Ratio > qnorm(seuil_refus / 100, Mean, Std_dev),];
Causes_pbs <- vector()


for(i in 1:length(Pb_User)){
  a <- tot_dep[tot_dep$typeD!=1 & as.character(tot_dep$IdUserD) == as.character(Pb_User[i,]$Users),]$typeD;
  tt <- table (a);
  Causes_pbs <- causes[which(tt==max(tt)) + 1];
}
  # print("Liste des users probelmatiques:");
# print(Table_error_users[Table_error_users$Ratio > qnorm(seuil_refus / 100, Mean, Std_dev),])
write.csv(data.frame(Pb_User, Causes_pbs),file = "ModelError/UsersWithProblem.csv");