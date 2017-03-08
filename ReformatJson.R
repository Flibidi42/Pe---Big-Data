vec_texte <- scan(path_json, sep="\n", what='character');
vec_texte[1] <- paste("[", vec_text[1], ",");
for(i in 2:length(vec_texte)-1){
  vec_texte[i] <- paste(vec_text[i], ",");
}
vec_texte[length(vec_texte)] <- paste(vec_text[length(vec_texte)], "]");

jsonFormated <- character();

for(i in 1:length(vec_texte)){
  jsonFormated <- paste(jsonFormated, vec_texte[i]);
  
}

my_data <- fromJSON(jsonFormated);