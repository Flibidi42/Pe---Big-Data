library(plyr)
#****  variables pour la boucle ****
start <- as.Date("2016-01-01")
end   <- as.Date("2017-03-02")
theDate <- start
selected_data_temp <- data.frame() 
selected_data <- data.frame()
vctr_sum_deposits <- vector()
vctr_date <- data.frame()
selected_data_temp <- data.frame()
v<-vector()
d<-vector()

tmpPosX <- as.Date.POSIXct(2016-01-01)

for(i in start:end){
  v <- c(v,nrow(subset(totaux_depots, totaux_depots$DateD == i)))
  d <- c(d,i)
}
temp<-data.frame(d,v)
temp$d<-as.Date(temp$d,tmpPosX)
temp$d<-weekdays(temp$d)
sum_lundi<-sum(subset(temp$v,temp$d=="lundi"))
sum_mardi<-sum(subset(temp$v,temp$d=="mardi"))
sum_mercredi<-sum(subset(temp$v,temp$d=="mercredi"))
sum_jeudi<-sum(subset(temp$v,temp$d=="jeudi"))
sum_vendredi<-sum(subset(temp$v,temp$d=="vendredi"))
sum_samedi<-sum(subset(temp$v,temp$d=="samedi"))
sum_dimanche<-sum(subset(temp$v,temp$d=="dimanche"))

somme <- c(sum_lundi,sum_mardi,sum_mercredi,sum_jeudi,sum_vendredi,sum_samedi,sum_dimanche)
