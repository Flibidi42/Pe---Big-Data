library(jsonlite)
my_data <- fromJSON('~/Desktop/terradona/Terradona_init/sample_69.json');

#Id conteneur
IDs_conteneur <-  my_data$containerStatus$`_id`$`$oid`;

#Liste des d?pots
DepotListe <- list();
l <- vector();
for(i in 1:nrow(my_data)){# On parcourt les diff?rents relev?s
  if(is.null(my_data[i,"containerDataList"][[1]])){ # cas o? il n'y pas de d?pot(NULL)
    DepotListe[[i]] <- NULL;
  }
  else{
    UserId <- vector(); #Vecteur d'ID user
    WasteSize <- vector(); #Vecteur de WasteSize
    WasteType <- vector(); #Vecteur de WasteType
    DepotDate <- vector(); #Vecteur de date de d?pot
    DepotLat <- vector()
    for(j in 1:nrow(my_data[i,"containerDataList"][[1]])){ # On parcourt les diff?rents d?pots
      l <-c(l,length(l)+1);
      UserId <- c(UserId, my_data[i,"containerDataList"][[1]][j,"userId"][,"$binary"]);
      WasteSize <- c(WasteSize, strtoi(my_data[i,"containerDataList"][[1]][j,"wasteSize"][1,1]));
      WasteType <- c(WasteType, strtoi(my_data[i,"containerDataList"][[1]][j,"wasteType"][1,1]));
      DepotDate <- c(DepotDate, as.character(my_data[i,"containerDataList"][[1]][j,"date"]));
      DepotLat <- c(DepotLat, as.double(my_data$containerInfoList[[i]]$latitude[length(my_data$containerInfoList[[i]]$latitude)]))
    }
    DepotListe[[i]] <- data.frame(UserId,DepotLat,WasteSize,WasteType,DepotDate); #On regroupe tout ?a dans la liste des d?pots
    #TestList <- data.frame(UserId,,WasteSize,WasteType,DepotDate)
  }
}
rm(UserId,DepotLat,WasteSize,WasteType,DepotDate);
#Info geo
Latitude <- vector();
Longitude <- vector();
ID_Conteneur <- vector();
for(i in 1:nrow(my_data)){
  Latitude <- c(Latitude, my_data$containerInfoList[[i]]$latitude[length(my_data$containerInfoList[[i]]$latitude)]);
  Longitude <- c(Longitude, my_data$containerInfoList[[i]]$longitude[length(my_data$containerInfoList[[i]]$longitude)]);
  ID_Conteneur<- c(ID_Conteneur,my_data$containerInfoList[[i]]$serialNumber[length(my_data$containerInfoList[[i]]$serialNumber)])
}

#Date
Date <- my_data$createdAt