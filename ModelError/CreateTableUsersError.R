tot_dep_error <- tot_dep[tot_dep$IdUserD != "AAAAAAAAAAA="  & 
                           tot_dep$IdUserD != "" & 
                           tot_dep$typeD %in% c(0,1,2,3,4,5),]
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
                     
  Ratio <- c(Ratio, nrow(tot_dep[tot_dep$IdUserD==Id 
                                 & (is.na(tot_dep$typeD) 
                                 | tot_dep$typeD!=1),]));
  
}

Ratio <- Ratio / tot_dep_users

# Rprof()
Ratio <- Ratio[tot_dep_users > nb_depot_min];
Users <- Users[tot_dep_users > nb_depot_min];


Table_error_users <- data.frame(Users, Ratio)


# rm(Users, Ratio, tot_dep)