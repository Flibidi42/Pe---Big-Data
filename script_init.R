my_data <- fromJSON("sample_69.json");

#Id conteneur
IDs_conteneur <-  my_data$containerStatus$`_id`$`$oid`;

#Liste des dépots
DepotListe <- list();
for(i in 1:nrow(my_data)){# On parcourt les différents relevés
  if(is.null(my_data[i,"containerDataList"][[1]])){ # cas où il n'y pas de dépot(NULL)
    DepotListe[[i]] <- NULL;
  }
  else{
    UserId <- vector(); #Vecteur d'ID user
    WasteSize <- vector(); #Vecteur de WasteSize
    WasteType <- vector(); #Vecteur de WasteType
    for(j in 1:nrow(my_data[i,"containerDataList"][[1]])){ # On parcourt les différents dépots
      UserId <- c(UserId, my_data[i,"containerDataList"][[1]][j,"userId"][,"$binary"]);
      WasteSize <- c(WasteSize, strtoi(my_data[i,"containerDataList"][[1]][j,"wasteSize"][1,1]));
      WasteType <- c(WasteType, strtoi(my_data[i,"containerDataList"][[1]][j,"wasteType"][1,1]));
    }
    DepotListe[[i]] <- data.frame(UserId,WasteSize,WasteType); #On regroupe tout ça dans la liste des dépots
  }
}

#Info geo
Latitude <- vector();
Longitude <- vector();
for(i in 1:nrow(my_data)){
  Latitude <- c(Latitude, my_data$containerInfoList[[i]]$latitude[length(my_data$containerInfoList[[i]]$latitude)]);
  Longitude <- c(Longitude, my_data$containerInfoList[[i]]$longitude[length(my_data$containerInfoList[[i]]$longitude)]);
}

#Date
Date <- my_data$createdAt$`$date`