#Main execution file

source("~/Desktop/terradona/Terradona_init/constantes.R")
source(string_path_script_init)
print("string path script init")
source(string_path_UserClass)
print("source string path user class")
source(string_path_contClass)
print("source string path contClass")
source(string_path_JointureDepot)
print("source(string_path_JointureDepot)")

library(ggmap)
library(mapproj)

#map <- get_map(location = c(lon = 5.1, lat = 43.3), zoom = 7)
#ggmap(map)