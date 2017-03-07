#Création UserList
UserClass <- data.frame();
UserList <- vector();#Table des utilisateurs
print("Création de la table des utilisateurs")
for(i in 1:length(DepotListe)){#Parcours de chaque requÃªte
  if(is.null(DepotListe[[i]])){
  }
  else{
    for(j in 1:length(DepotListe[[i]])){#Parcours de chaque dÃ©pot au sein de la requÃªte
      if(is.na(DepotListe[[i]][j,"UserId"])){}else{
        if(is.element(DepotListe[[i]][j,"UserId"],UserList)){}else{
          UserList <- c(UserList,as.character(DepotListe[[i]][j,"UserId"]));
        }
      }
    }
  }
}