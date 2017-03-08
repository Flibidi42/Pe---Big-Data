#Cr?ation UserList

UserClass <- data.frame()

UserList <- vector()
#Table des utilisateurs

print("Creation de la table des utilisateurs")
for (i in 1:length(DepotListe)) {
  #Parcours de chaque requête
  if (is.null(DepotListe[[i]])) {
    
  }
  else{
    for (j in 1:length(DepotListe[[i]])) {
      #Parcours de chaque dépot au sein de la requête
      if (is.na(DepotListe[[i]][j, "UserId"])) {
        
      } else{
        if (is.element(DepotListe[[i]][j, "UserId"], UserList)) {
          
        } else{
          UserList <- c(UserList, as.character(DepotListe[[i]][j, "UserId"]))
        }
      }
    }
  }
}
