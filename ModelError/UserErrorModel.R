


tot_dep <- totaux_depots[totaux_depots$IdUserD != "AAAAAAAAAAA=",]
Users <- vector()

Ratio <- vector()

tot_dep_users <- vector()


pb <- txtProgressBar(title = "progress bar",
                     min = 0,
                     max = nrow(tot_dep))
# Rprof("tmp.out")
for (i in 1:nrow(tot_dep)) {
  if (i %% 1000 == 0){
    setTxtProgressBar(pb, i)
  }
  Id = as.character(tot_dep[i, ]$IdUserD);
  if (!(Id %in% Users)) {
    Users <- c(Users, Id)
    
    Ratio <- c(Ratio, 0)
    
    tot_dep_users <- c(tot_dep_users, 0)
    
  }
  if (is.na(tot_dep[i, ]$typeD) | is.na(tot_dep[i, ]$sizeD) |
      tot_dep[i, ]$typeD %in% c(0, 2, 3, 4, 5)) {
    Ratio[Users == Id] <- Ratio[Users == Id] + 1
    
  }
  tot_dep_users[Users == Id] <- tot_dep_users[Users == Id] + 1
  
  
}
# Rprof()
Ratio <- Ratio / tot_dep_users


Table_error_users <- data.frame(Users, Ratio)


rm(Users, Ratio, tot_dep)