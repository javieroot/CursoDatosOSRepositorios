############################################################################################################################
# Este script utiliza partes del tutorial básico de análisis con R en http://www.r-tutor.com/elementary-statistics/quantitative-data
# Para ello se cargan los datos "faithful" una colección de observaciones del geyser Old Faithful 
# del Yellowstone National Park. 

library(datasets)
head(faithful)

# Evaluamos la duración de las erupciones viendo su rango y dibujando un histograma
duracion = faithful$eruptions
range(duracion)
hist(duracion,right=FALSE)

# El histograma lo podemos hacer más colorido
colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan") 
hist(duracion, right=FALSE, col=colors,main="Erupciones del Old Faithful Eruptions", xlab="Duración en minutos")

espera = faithful$waiting        
plot(duracion, espera,  xlab="Duración erupción",ylab="Tiempo de espera")
abline(lm(espera ~ duracion))

# Medidas de dispersión
mean(duracion)  
median(duracion) 
boxplot(duracion, horizontal=TRUE)