str_path ="JDepotBis/"
str_file_name ="JdepotCSVwCont"
my_data_ok <- list()

for(i in 1:79){
  my_data_ok[[i]] <- read.csv(paste(str_path, str_file_name,i,".csv",sep = ""))
}

#my_data_ok[[1]]

#concatenation de tous les csv (2-3 minutes sur mon 6Gio de ram & i5)
totaux_depots <- data.frame()
for(i in 1:79){
  totaux_depots <- rbind(totaux_depots, my_data_ok[[i]])
}

rm(my_data_ok);