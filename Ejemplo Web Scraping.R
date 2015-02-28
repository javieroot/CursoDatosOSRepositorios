############################################################################################################################
## Ejemplo de web scraping para obtener datos de una tabla de los resultados de elecciones 
## municipales de el periodico El Pais 
## http://resultados.elpais.com/elecciones/2011/municipales/12/28/127.html
############################################################################################################################
library(XML)

mps <- paste("http://resultados.elpais.com/elecciones/2011/municipales/12/28/127.html",sep="")
  
# primero convertimos el documento para poder navegarlo
mps.doc <- htmlParse(mps, encoding="UTF-8")

# miramos el html para ver las etiquetas de donde se sacan los valores que necesitamos
Partido <- xpathSApply(mps.doc,"//th[@class='nombrePartido']",xmlValue)
Concejales <- xpathSApply(mps.doc,"//td[@class='tipoNumeroElectos']",xmlValue)
Votos <- xpathSApply(mps.doc,"//td[@class='tipoNumeroVotos']",xmlValue)

# lo convertimos en una tabla
eleccion <- cbind (Partido,Concejales,Votos)
eleccion <- as.data.frame(eleccion)

# lo exportamos a un fichero csv
write.table(eleccion, "eleccion.csv", sep=";")


# Si queremos obtener los datos para varios municipios utilizamos un For
eleccion_full <- data.frame(matrix(ncol = 4))
colnames(eleccion_full) <- c("Municipio","Partido" ,"Concejales" , "Votos")

for (i in 11:40){
  
  # URL of interest: 
  mps <- paste("http://resultados.elpais.com/elecciones/2011/municipales/12/28/",i,".html",sep="")
  
  # primero convertimos el documento para poder navegarlo
  mps.doc <- htmlParse(mps, encoding="UTF-8")
  
  # miramos el html para ver las etiquetas de donde se sacan los valores que necesitamos
  Municipio <- xpathSApply(mps.doc,"//div[@class='resultado-unidad estirar']/h1",xmlValue)
  Partido <- xpathSApply(mps.doc,"//th[@class='nombrePartido']",xmlValue)
  Concejales <- xpathSApply(mps.doc,"//td[@class='tipoNumeroElectos']",xmlValue)
  Votos <- xpathSApply(mps.doc,"//td[@class='tipoNumeroVotos']",xmlValue)
  
  # lo convertimos en una tabla
  Municipio <- gsub("\nver resultados en autonómicas »\n","",Municipio)
  Municipio <- rep(Municipio,4)
  eleccion <- cbind (Municipio,Partido,Concejales,Votos)
  eleccion <- as.data.frame(eleccion)
  
  eleccion_full <- rbind (eleccion_full,eleccion)
  writeLines(paste("iteración: ",i))
}

# lo exportamos a un fichero csv
write.table(eleccion_full, "eleccion_full.csv", sep=";")
