#Obtenemos los datos del fichero csv
datos <- read.table("data/TaxiFlota.csv", sep = ";", header = TRUE )

dim(datos) # Vemos la dimension
head(datos,5) # Mostramos toda la info de los 5 primeros
tail(datos) # Consultamos los últimos datos

datos[datos$Combustible == "DIESEL",] # Nos devuelve todos los taxis cuyo combustible es DIESEL

plot(datos$Combustible , datos$Marca)

head(datos[datos$Número.de.Plazas > 5 & datos$Clasificación.medioambiental == "ECO",],5)

hist(datos$Potencia)

table(table(datos$Matrícula)) # Contamos las frecuencias de Código # Para ver duplicados

# EN PRIMER LUGAR VAMOS A CAMBIAR LOS NOMBRES DE LAS COLUMNAS

# Tenemos dos formas de hacerlo:

# 1) O bien una a una (pero si son muchas no tiene sentido)
mi.datos <- datos
colnames(mi.datos)[1] <- "codigo"
colnames(mi.datos)[2] <- "matricula"
colnames(mi.datos)[3] <- "fecha_matriculacion"
colnames(mi.datos)[8] <- "clasificacion_medioambiental"
colnames(mi.datos)[12] <- "numero_plazas"
colnames(mi.datos)[13] <- "fecha_inicio_prestacion"
colnames(mi.datos)[15] <- "regimen_eurotaxi"
colnames(mi.datos)[16] <- "fecha_inicio_eurotaxi"
colnames(mi.datos)[17] <- "fecha_fin_eurotaxi"

# 2) O bien paso por paso como vamos a hacer ahora:

#Primero quitamos todas las mayúsculas
mi.datos2 <- datos
colnames(mi.datos2) <- sapply(colnames(mi.datos2), tolower) 

# Buscamos los . y los sustituimos por _
colnames(mi.datos2) <- gsub("\\.", "_", colnames(mi.datos2)) 

#Por ultimo quitamos todas las tildes
colnames(mi.datos2) <- iconv(colnames(mi.datos2), to='ASCII//TRANSLIT')


#Si aun asi, vemos que tenemos nombres muy largos...
#Acortamos algunos de los nombres de ciertas columnas específicas 
colnames(mi.datos2)[12] <- "numero_plazas"
colnames(mi.datos2)[13] <- "fecha_inicio_prestacion"
colnames(mi.datos2)[15] <- "regimen_eurotaxi"
colnames(mi.datos2)[16] <- "fecha_inicio_eurotaxi"
colnames(mi.datos2)[17] <- "fecha_fin_eurotaxi"

colnames(mi.datos2)


