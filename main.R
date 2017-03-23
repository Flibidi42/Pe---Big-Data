#Main execution file

#La premiere etape doit consister à indiquer le chemin à suivre pour le workspace
#pour connaitre votre workspace actuel :
getwd()
#pour set le workspace : (dir etant le chemin jusqu'au dossier racine (inclure ce dernier dans le chemin))
setwd("/home/chanut/Desktop/terradona/Terradona_init")
#installer les librairies necessaires : mettre en commentaire si elles sont deja installees
source("InstallationScript.R")

#sur Rstudio, vous pouvez runner le script ligne par ligne avec ctrl+enter

#import des donnees : nous l'avons mis en commentaire car l'execution prend plusieurs heures.
#nous fournissons les csv qui seraient exportes dans le dossier "" du dossier racine

# source('C:/Users/philippe/Desktop/3A/PE/R/NouveauDossier/constantes.R')
# print("string path script init.R")
# source("string_path_UserClass.R")
# print("source string path user class")
# source(string_path_contClass)
# print("source string path contClass")
# source(string_path_JointureDepot)
# print("source(string_path_JointureDepot)")
# source("export_csv.R")
# print("export_csv.R")

#visualisation des donnees
  #pour passer des 79 fichiers csv (un par depot) à des tables
  source("import_csv.R")
  #le script "visualisationDesDonnees.R" permet d'afficher et eventuellement exporter
  #des graphs, selon des critères laissés au choix de l'utilisateur
  #vous pouvez notamment 
  source("visualisationDesDonnees.R")
#
#clustering
source("Clustering/Users/MainClustering.R")
source("Clustering/Cont/MainClustContScript.R")
source("Clustering/ModelError/ModelFaiCont.R") #dans l'ordremodel failcomtpe,  create tableuser, modelefailusers, linkedwithcluster, '
source("Clustering/ModelError/CreateTableUsersError.R")
source("Clustering/ModelError/ModelFaiCont.R")
source("Clustering/ModelError/ModelFailUsers.R")
source("Clustering/ModelError/LinkWithClusters.R")

library(ggmap)
library(mapproj)

#map <- get_map(location = c(lon = 5.1, lat = 43.3), zoom = 7)
#ggmap(map)