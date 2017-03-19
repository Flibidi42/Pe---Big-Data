


tot_dep <- totaux_depots[totaux_depots$IdUserD != "AAAAAAAAAAA=",]
Users <- vector()

Ratio <- vector()

tot_dep_users <- vector()

nb_depot_min <- 20

un_user <- unique(as.character(tot_dep$IdUserD))

pb <- txtProgressBar(title = "progress bar",
                     min = 0,
                     max = length(un_user))
# Rprof("tmp.out")
for (i in 1:length(un_user)) {
  if (i %% 100 == 0){
    setTxtProgressBar(pb, i)
  }
  Id = as.character(un_user[i]);
  Users <- c(Users, Id)
    
  tot_dep_users <- c(tot_dep_users, nrow(tot_dep[tot_dep$IdUserD==Id,]))
                     
  Ratio <- c(Ratio, nrow(tot_dep[tot_dep$IdUserD==Id & (is.na(tot_dep$typeD) | tot_dep$typeD!=1),]));
  
}
# Rprof()

Ratio <- Ratio / tot_dep_users
to_remove <- vector();
for(i in 1:length(tot_dep_users)){
  if(tot_dep_users[i] <= nb_depot_min){
    to_remove <- c(to_remove, i)
  }
}
Ratio <- Ratio[-to_remove];
Users <- Users[-to_remove];

Table_error_users <- data.frame(Users, Ratio)


# rm(Users, Ratio, tot_dep, to_remove)