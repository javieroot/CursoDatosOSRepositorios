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

